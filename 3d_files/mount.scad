$fn=128;

depth = 10;

module servo(){
    translate([-10,-10,0]){
        cube([40.5, 20, 38]);
        // flaps
        translate([-7, 0,27])
        cube([40.5+2*7,20,2.5]);
        // servo-horn 27.6 from far side
        translate([40.5-27.6-3,10,38])
        cylinder(r=3, h=6);
        
        // cables
        translate([-10,(20-8)/2,3])
        cube([10,8,4]);
    }
}

module mount(){
    // bar should be 9 cm from wall
    // wall
    //translate([-250,90, -250]) %cube([500, 10, 5000]);

    // model bar
    // translate([0,0,45])    cylinder(r=28/2, h=500);

    // housing/mount
    difference(){
        translate([10,37,20])
        cube([55, 75+30,20], center=true);
        
        translate([-8,20,5])
        cube([75, 60, 30]);

        scale([1.05, 1.05, 1.05])
        servo();
        
        translate([-20,-5,9])
        cube([10,10,12]);
        
        translate([30,-5,9])
        cube([10,10,12]);
    }
    translate([-8,18,10])
        rotate([0,0,-25])
        cube([10, 75, 20]);

    difference(){
        translate([5,90-5,20])
        cube([80, 10, 20], center=true);
        
        translate([38,95,20])
        rotate([90,0,0])
        cylinder(r=2, h=40);
        
        translate([-28,95,20])
        rotate([90,0,0])
        cylinder(r=2, h=40);
    }
}

module mount_passive(){
    // bar should be 9 cm from wall
    // wall
    //translate([-250,90, -250]) %cube([500, 10, 5000]);

    // model bar
    // translate([0,0,45])    cylinder(r=28/2, h=500);
    difference(){
        union(){
            // housing/mount
            difference(){
                translate([0,33,depth])
                cube([40, 75+30,depth], center=true);
                
                translate([-13,20,0])
                cube([75, 60, depth+10]);
            }
            translate([-8,18,depth/2])
            rotate([0,0,-25])
            cube([10, 75, depth]);

            difference(){
                translate([5,90-5,depth])
                cube([80, 10, depth], center=true);
                
                translate([38,95,depth])
                rotate([90,0,0])
                cylinder(r=2, h=40);
                
                translate([-28,95,depth])
                rotate([90,0,0])
                cylinder(r=2, h=40);
            }
        }
        scale([1.1,1.1,1.1])
       translate([0,0,0]) cylinder(r=28/2, h=40);
    }
    
}

module adapter(){
    // to attach a servo-wheel-horn to the bar itself
    // bar is 28mm in diameter
    // servo-wheel is 21.5mm in diameter
    difference(){
        cylinder(r=28/2+1, h=10);
        translate([0,0,1])
        cylinder(r=28/2, h=10);
    }
    
    translate([0,0,-2])
    difference(){
        cylinder(r=21.5/2+1, h=2);
        translate([0,0,-1])
        cylinder(r=21.5/2, h=2);
    }
}

//mount();
//translate([0,0,500])
mount_passive();

//#servo();

//adapter();
/*

# translate([0,0,50]) cylinder(r=28/2, h=450);
*/