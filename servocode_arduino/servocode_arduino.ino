#include <Servo.h> 
//#include "Adafruit_VL53L0X.h"
#include <Adafruit_SSD1306.h>
#include <Wire.h>
#include <VL53L0X.h>  // VL53L0X by Polulu

#define DISPLAY_W 128
#define DISPLAY_H 64

#define DISPLAY_I2C_ADDRESS 0x3C

#define lox_lower_addr 42
#define lox_upper_addr 41

const uint8_t pin_servo = 3;

const uint8_t pin_xshut_upper = 11;

const uint8_t pin_btn_1 = A1;
const uint8_t pin_btn_2 = A0;

int state = 0;  // oben


//------- Display
Adafruit_SSD1306 display(DISPLAY_W, DISPLAY_H, &Wire);
 
//------- TOFs
//Adafruit_VL53L0X lox_up = Adafruit_VL53L0X();
VL53L0X lox_lower; // = Adafruit_VL53L0X();
VL53L0X lox_upper;

//------- Servo
Servo serv;
short dir = 0; // -1: down, 1: up
 
void setup() { 
  Serial.begin(9600);
  Wire.begin();
  
  pinMode(pin_btn_1, INPUT_PULLUP);

  pinMode(pin_xshut_upper, OUTPUT);
  digitalWrite(pin_xshut_upper, LOW);

  delay(100);
  
  lox_lower.init();
  lox_lower.setAddress(lox_lower_addr);  // set address of upper

  pinMode(pin_xshut_upper, INPUT);
  delay(50);
  lox_upper.init();
  
  lox_lower.setTimeout(500);
  lox_upper.setTimeout(500);

  if (display.begin(SSD1306_SWITCHCAPVCC, DISPLAY_I2C_ADDRESS)) {
    //display.setRotation(1);
    display.clearDisplay();      // Display(puffer) löschen
    display.setTextSize(1);      // kleine Schriftgröße (Höhe 8px)
    display.setTextColor(WHITE); // helle Schrift, dunkler Grund)
    display.setCursor(0, 0);     // links oben anfangen
    display.println("Starting up");
    display.display();
  }
} 
 
 
void loop() {  

  int button_state = digitalRead(pin_btn_1);
  Serial.println("Got Button-state");
  
  int d_lower = lox_lower.readRangeSingleMillimeters();
  if (lox_lower.timeoutOccurred()) {
    Serial.println("Timeout in lox low!");
  }

  int d_upper = lox_upper.readRangeSingleMillimeters();
  if (lox_upper.timeoutOccurred()) {
    Serial.println("Timeout in lox up!");
  }
  
  // react to buttons and sensors
  if(button_state == LOW && !serv.attached()){
    if(state == 0){ // war oben
      state = 1;
      dir = -1;
    }else if(state == 1){ // war unten
      state = 0;
      dir = 1;
    }
  }else if(button_state == HIGH){
    dir = 0;
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

  display.clearDisplay();
  display.setCursor(0, 0);

  display.print("SLo: ");
  display.print(d_lower);
  display.println(" mm");

  display.print("SUp: ");
  display.print(d_upper);
  display.println(" mm");

  display.println();
  
  display.print("B1: ");
  display.println(button_state);

  display.println();
  
  display.print("state: ");
  display.println(state);

  display.println();

  display.print("dir: ");
  display.println(dir);
  
  display.display();
  
} 
