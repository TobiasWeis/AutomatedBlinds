// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myservo;  
const int pin_btn_down = 8;
const int pin_btn_up = 7;
// servo-pin default is 9
int dir = 0;
 
void setup() { 
  pinMode(pin_btn_down, INPUT_PULLUP);
  pinMode(pin_btn_up, INPUT_PULLUP);  
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
} 
 
 
void loop() {  
  if(digitalRead(pin_btn_down) == LOW){
    myservo.attach(9);
    myservo.write(0);
  }else if(digitalRead(pin_btn_up) == LOW){
    myservo.attach(9);
    myservo.write(180);
  }else{
     myservo.detach();
  }

  /* for other direction  
   myservo.attach(9);
 myservo.write(180);
 delay(1000);
 myservo.detach();

  delay(2000); */
} 
