#include <Servo.h> 
#include "Adafruit_VL53L0X.h"

const uint8_t pin_servo = PD3;
const uint8_t pin_xshut_up = PD7;
const uint8_t pin_xshut_down = PD4;
const uint8_t pin_btn_down = PD6;
const uint8_t pin_btn_up = PD2;
 
//------- TOFs
Adafruit_VL53L0X lox_up = Adafruit_VL53L0X();
Adafruit_VL53L0X lox_down = Adafruit_VL53L0X();

//------- Servo
Servo serv;
short dir = 0; // -1: down, 1: up
 
void setup() { 
  Serial.begin(9600);
    pinMode(pin_btn_down, INPUT_PULLUP);
    pinMode(pin_btn_up, INPUT_PULLUP);
    pinMode(pin_xshut_up, OUTPUT);
    pinMode(pin_xshut_down, OUTPUT);

    digitalWrite(pin_xshut_up, LOW);
    digitalWrite(pin_xshut_down, LOW);
    delay(500);

    digitalWrite(pin_xshut_up, HIGH);
    digitalWrite(pin_xshut_down, HIGH);
    delay(500);

    // LOW means off
    digitalWrite(pin_xshut_up, LOW);
    digitalWrite(pin_xshut_down, LOW);
    delay(500);

    digitalWrite(pin_xshut_up, HIGH);
    delay(10);
    
    if (!lox_up.begin(0x30)) {
      Serial.println(F("Failed to boot LOX_UP"));
      while(1);
    }
    delay(10);
    
    // activate the second    
    digitalWrite(pin_xshut_down, HIGH);
    delay(10);
    
    if (!lox_down.begin(0x31)) {
      Serial.println(F("Failed to boot LOX_DOWN"));
      while(1);
    }
} 
 
 
void loop() {  
  VL53L0X_RangingMeasurementData_t measurement;
  
  if(digitalRead(pin_btn_down) == LOW){
    if(!serv.attached()){
      Serial.println(F("Button down pressed"));
      
    // check lower sensor: only drive if lower sensor is free
    lox_down.rangingTest(&measurement, false);
    if(measurement.RangeMilliMeter > 150 || measurement.RangeStatus == 4){ // above 15cm or out of range
        dir = -1;
        Serial.println(F("Button down: set dir to -1"));
      }else{
        Serial.println(F("Button down: NOP: sensor not free"));
      }
    }
  }

  if(digitalRead(pin_btn_up) == LOW){
    if(!serv.attached()){
      Serial.println(F("Button up pressed"));
      // check upper sensor: only drive if upper sensor is occupied
      lox_up.rangingTest(&measurement, false);
      if(measurement.RangeMilliMeter <= 150 && measurement.RangeStatus != 4){ // above 15cm or out of range     
        dir = 1;
        Serial.println(F("Button up: set dir to 1"));
      }else{
        Serial.println(F("Buttn up: NOP: sensor is free"));
      }
    }
  }

  // check the sensor while driving down
  if(dir == -1 && serv.attached()){
    // check sensor
      lox_down.rangingTest(&measurement, false);
      if(measurement.RangeMilliMeter <= 150){
        Serial.println(F("Stop driving down, lower sensor triggered"));
        dir = 0; // stop again
        delay(500); // let it go a little beyond the sensor
      }
  }

  // check the sensor while driving up
  if(dir == 1 && serv.attached()){
    // check sensor
      lox_up.rangingTest(&measurement, false);
      if(measurement.RangeMilliMeter > 150 || measurement.RangeStatus == 4){
        Serial.println(F("Stop driving up, upper sensor is free"));
        dir = 0; // stop again
      }
  }

  if(dir == -1){
    if(!serv.attached()){
      Serial.println(F("Servo going down"));
      serv.attach(pin_servo, 700, 2300);  // attaches the servo on pin 9 to the servo object 
      delay(50);
      serv.writeMicroseconds(2000);
    }
  }else if(dir == 1){
    if(!serv.attached()){
      Serial.println(F("Servo going up"));
      serv.attach(pin_servo, 700, 2300);  // attaches the servo on pin 9 to the servo object 
      delay(50);
      serv.writeMicroseconds(800);
    }
  }else{ // dir == 0
    if(serv.attached()){
      Serial.println(F("Servo Stop"));
      serv.writeMicroseconds(1500);
      delay(100);
      serv.detach();
    }
  }

} 
