EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "jeu. 02 avril 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8700 1100 0    60   ~ 0
1(Tx)
Text Label 8700 1200 0    60   ~ 0
0(Rx)
Text Label 8700 1300 0    60   ~ 0
Reset
Text Label 8700 1500 0    60   ~ 0
2
Text Label 8700 1600 0    60   ~ 0
3(**)
Text Label 8700 1700 0    60   ~ 0
4
Text Label 8700 1800 0    60   ~ 0
5(**)
Text Label 8700 1900 0    60   ~ 0
6(**)
Text Label 8700 2000 0    60   ~ 0
7
Text Label 8700 2100 0    60   ~ 0
8
Text Label 8700 2200 0    60   ~ 0
9(**)
Text Label 8700 2300 0    60   ~ 0
10(**/SS)
Text Label 8700 2400 0    60   ~ 0
11(**/MOSI)
Text Label 8700 2500 0    60   ~ 0
12(MISO)
Text Label 10550 2500 0    60   ~ 0
13(SCK)
Text Label 10550 2200 0    60   ~ 0
A0
Text Label 10550 2100 0    60   ~ 0
A1
Text Label 10550 2000 0    60   ~ 0
A2
Text Label 10550 1900 0    60   ~ 0
A3
Text Label 10550 1800 0    60   ~ 0
A4
Text Label 10550 1700 0    60   ~ 0
A5
Text Label 10550 1600 0    60   ~ 0
A6
Text Label 10550 1500 0    60   ~ 0
A7
Text Label 10550 2300 0    60   ~ 0
AREF
Text Label 10550 1300 0    60   ~ 0
Reset
Text Notes 10800 1000 0    60   ~ 0
Holes
Text Notes 8500 575  0    60   ~ 0
Shield for Arduino Nano
Text Label 10250 950  1    60   ~ 0
Vin
Wire Notes Line
	8475 650  9675 650 
Wire Notes Line
	9675 650  9675 475 
$Comp
L Connector_Generic:Conn_01x01 P3
U 1 1 56D73ADD
P 10800 650
F 0 "P3" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10800 650 50  0001 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
$Comp
L Connector_Generic:Conn_01x01 P4
U 1 1 56D73D86
P 10900 650
F 0 "P4" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10900 650 50  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D73DAE
P 11000 650
F 0 "P5" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 11000 650 50  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D73DD9
P 11100 650
F 0 "P6" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 11100 650 50  0001 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x15 P1
U 1 1 56D73FAC
P 9550 1800
F 0 "P1" H 9550 2600 50  0000 C CNN
F 1 "Digital" V 9650 1800 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 9550 1800 50  0001 C CNN
F 3 "" H 9550 1800 50  0000 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 P2
U 1 1 56D740C7
P 9950 1800
F 0 "P2" H 9950 2600 50  0000 C CNN
F 1 "Analog" V 10050 1800 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 9950 1800 50  0001 C CNN
F 3 "" H 9950 1800 50  0000 C CNN
	1    9950 1800
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D7422C
P 9250 2600
F 0 "#PWR03" H 9250 2350 50  0001 C CNN
F 1 "GND" H 9250 2450 50  0000 C CNN
F 2 "" H 9250 2600 50  0000 C CNN
F 3 "" H 9250 2600 50  0000 C CNN
	1    9250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1400 9250 1400
Wire Wire Line
	9250 1400 9250 2600
Wire Wire Line
	9350 1100 8700 1100
Wire Wire Line
	8700 1200 9350 1200
Wire Wire Line
	9350 1300 8700 1300
Wire Wire Line
	8700 1500 9350 1500
Wire Wire Line
	9350 1600 8700 1600
Wire Wire Line
	8700 1700 9350 1700
Wire Wire Line
	9350 1800 8700 1800
Wire Wire Line
	8700 1900 9350 1900
Wire Wire Line
	9350 2000 8700 2000
Wire Wire Line
	8700 2100 9350 2100
Wire Wire Line
	9350 2200 8700 2200
Wire Wire Line
	8700 2300 9350 2300
Wire Wire Line
	9350 2400 8700 2400
Wire Wire Line
	8700 2500 9350 2500
$Comp
L power:GND #PWR04
U 1 1 56D746ED
P 10250 2600
F 0 "#PWR04" H 10250 2350 50  0001 C CNN
F 1 "GND" H 10250 2450 50  0000 C CNN
F 2 "" H 10250 2600 50  0000 C CNN
F 3 "" H 10250 2600 50  0000 C CNN
	1    10250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2600 10250 1200
Wire Wire Line
	10250 1200 10150 1200
Wire Wire Line
	10150 1100 10250 1100
Wire Wire Line
	10250 1100 10250 950 
$Comp
L power:+5V #PWR05
U 1 1 56D747E8
P 10350 950
F 0 "#PWR05" H 10350 800 50  0001 C CNN
F 1 "+5V" V 10350 1150 28  0000 C CNN
F 2 "" H 10350 950 50  0000 C CNN
F 3 "" H 10350 950 50  0000 C CNN
	1    10350 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 950  10350 1400
Wire Wire Line
	10350 1400 10150 1400
$Comp
L power:+3V3 #PWR06
U 1 1 56D74854
P 10450 950
F 0 "#PWR06" H 10450 800 50  0001 C CNN
F 1 "+3.3V" V 10450 1150 28  0000 C CNN
F 2 "" H 10450 950 50  0000 C CNN
F 3 "" H 10450 950 50  0000 C CNN
	1    10450 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 950  10450 2400
Wire Wire Line
	10450 2400 10150 2400
Wire Wire Line
	10550 1300 10150 1300
Wire Wire Line
	10150 1500 10550 1500
Wire Wire Line
	10550 1600 10150 1600
Wire Wire Line
	10550 1700 10150 1700
Wire Wire Line
	10150 1800 10550 1800
Wire Wire Line
	10550 1900 10150 1900
Wire Wire Line
	10550 2000 10150 2000
Wire Wire Line
	10150 2100 10550 2100
Wire Wire Line
	10550 2200 10150 2200
Wire Wire Line
	10550 2300 10150 2300
Wire Wire Line
	10150 2500 10550 2500
Wire Notes Line
	11200 1050 10650 1050
Wire Notes Line
	10650 1050 10650 500 
Wire Notes Line
	11200 2850 8450 2850
Wire Notes Line
	8450 2850 8450 500 
Text Notes 9650 1100 0    60   ~ 0
1
$Comp
L Connector:Jack-DC J1
U 1 1 617880D4
P 7250 1750
F 0 "J1" H 7307 2075 50  0000 C CNN
F 1 "Jack-DC" H 7307 1984 50  0000 C CNN
F 2 "" H 7300 1710 50  0001 C CNN
F 3 "~" H 7300 1710 50  0001 C CNN
	1    7250 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+6V #PWR01
U 1 1 61788B8F
P 7750 1650
F 0 "#PWR01" H 7750 1500 50  0001 C CNN
F 1 "+6V" H 7765 1823 50  0000 C CNN
F 2 "" H 7750 1650 50  0001 C CNN
F 3 "" H 7750 1650 50  0001 C CNN
	1    7750 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 617893BC
P 7800 2050
F 0 "#PWR02" H 7800 1800 50  0001 C CNN
F 1 "GND" H 7805 1877 50  0000 C CNN
F 2 "" H 7800 2050 50  0001 C CNN
F 3 "" H 7800 2050 50  0001 C CNN
	1    7800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1650 7750 1650
Wire Wire Line
	7550 1850 7800 1850
Wire Wire Line
	7800 1850 7800 2050
$EndSCHEMATC
