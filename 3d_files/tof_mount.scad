$fn=128;

/*
translate([])
rotate([90,0,0])
import("/home/weis/code/AutomatedBlinds/3d_files/vl53l0x.stl", convexity=3);
*/

module kabelkanal(){
    cube([12.5, 50, 1.5], center=true);
    
    translate([0,0,3.5])
    difference(){
        rotate([90,0,0])
        cylinder(r=10.3/2, h=50, center=true);
        
        rotate([90,0,0])
        cylinder(r=10.3/2-1, h=51, center=true);
        
        translate([0, 0, 5])
        cube([20, 51, 5], center=true);
        
        translate([0, 0, -6])
        cube([20, 51, 5], center=true);        
    }
}

module case(){
    translate([-9.7,0,-2.5])
    difference(){
        //cylinder(r=2, h=5, center=true);
        translate([-2.8,-3,-2.5])
        cube([5, 5, 5]);
        cylinder(r=1.5, h=5.1, center=true);
    }
    
    translate([9.7,0,-2.5])
    difference(){
        //cylinder(r=2, h=5, center=true);
        translate([-2.2,-3,-2.5])
        cube([5, 5, 5]);
        cylinder(r=1.5, h=5.1, center=true);
    }
    
    translate([0,-2,-5-3.75])
    difference(){
        cube([25, 8, 8], center=true);
        translate([0,0.1,1.01])
        cube([10, 13, 6], center=true);
    }
    
    translate([0,-8,-10.75])
    difference(){
        cube([20,5,4], center=true);
        
        translate([0,0,1.5])
        cube([10,6,4], center=true);
        
        translate([0,-20,-1.2])
        scale([1.1,1.1,1.1])
        kabelkanal();
    }
}

/*
translate([0,-31,-12])
kabelkanal();
*/
case();