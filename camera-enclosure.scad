cameraBody();
translate([0,-80,0]) backPanel();
translate([-50,10,0]) lensSquare();
translate([-50,-50,0]) lensRound();

// Camera body
module cameraBody() {
    difference(){

        cube([102,68,39]);
        
        // Open up the cube
        translate([1,1,1])
        {
            cube([100, 66, 40]);
        }
        // Notch to open case
        translate([-1,24,36])
        {
            cube([4, 20, 6]);
        }
        // Power switch
        translate([100,33,13])
        {
            cube([5, 15, 7]);
        }
        // Camera lense
        translate([64, 34, -12]) {
           #cylinder(r=40.2/2,h=14);
        }
        
        // Push button
        translate([12,-4, 20]) {
            rotate([0, 90, 90])cylinder(r=4,h=12);
        }
    }
    translate([64, 34, 0]) difference() {
        translate([0,0,0]) cylinder(r=43/2,h=4);
        translate([0,0,-1]) cylinder(r=40.2/2,h=14);
    }
}

module lensRound() {
    difference() {
        translate([21,21,0]) cylinder(r=42/2,h=12);
        translate([21,21,1]) cylinder(r=38/2,h=15);
        translate([21, 21, 0])roundCamera();
    }
    difference() {
        translate([21,21,0]) cylinder(r=40/2,h=15);
        translate([21,21,1]) cylinder(r=38/2,h=15);
        translate([21, 21, 0])roundCamera();
    }
    translate([10.8,10.8,0])screwmountC();
    translate([10.8,31.2,0])screwmountC();
    translate([31.2,31.2,0])screwmountC();
    translate([31.2,10.8,0])screwmountC();
}

module lensSquare() {
    difference() {
        translate([20,20,0]) cylinder(r=42/2,h=11);
        translate([20,20,1]) cylinder(r=38/2,h=14);
        translate([17.4, 17.4, -2])squareCamera();
    }
    difference() {
        translate([20,20,0]) cylinder(r=40/2,h=14);
        translate([20,20,1]) cylinder(r=38/2,h=14);
        translate([17.4, 17.4, -2])squareCamera();
    }
    translate([9.8,9.8,0])screwmountB();
    translate([30.2,30.2,0])screwmountB();
}

module backPanel() {
    difference() {
        cube([102,68,1]);
        translate([48.75,18.75,-6])
        {
            cube([28.5, 28.5, 10]);
        }
    }
    difference(){

        translate([1,1,1])cube([100,66,3]);
        
        // Open up the cube
        translate([3,3,3])
        {
            cube([96, 62, 6]);
        }
       
        // Open up the cube
        translate([48.75,18.75,-6])
        {
            cube([28.5, 28.5, 10]);
        }

    }
    
    translate([43.6, 13, 1])tft();
}

module tft() {
    translate([0, 0, 0])screwmount();
    translate([39.37, 38.1, 0])screwmount();
    translate([39.37, 0, 0])screwmount();
    translate([0, 38.1, 0])screwmount();
    
    // Uncomment to display what the tft would look like
    /*
    #translate([5.1, 5.8, 1])cube([28.7, 28.7, 5]);
    #difference() {
        translate([-2.54, -2.54, 5])cube([44.5, 43.18, 1.5]);
        translate([0, 0, 0])cylinder(r=1, h=10);
    }
    */
}


module roundCamera() {
    translate([0,0, -1])cylinder(r=9/2,h=12);
    translate([0,0, -2])cylinder(r1=16/2, r2=9/2,h=3);
}

module squareCamera() {
    translate([0,0,-2])cube([10, 6, 9]);
}

module screwmount() { 
    cylinder(r=2.5, h=4.5);
    translate([0,0,-1])cylinder(r=1.4, h=8.5);
    
    rotate_extrude(convexivity = 10) {
        translate([2.5,0,0]) {
            intersection() {
                square(8);
                difference() {
                    square(8, center = true);
                    translate([4,4])circle(4);
                }
            }
        }
    }
}

module screwmountB() {        
    cylinder(r=2.5, h=2.5);
    translate([0,0,0])cylinder(r=1.4, h=5);
    
    rotate_extrude(convexivity = 10) {
        translate([2.5,0,0]) {
            intersection() {
                square(4);
                difference() {
                    square(4, center = true);
                    translate([4,4])circle(4);
                }
            }
        }
    }
    
}

module screwmountC() {        
    cylinder(r=4, h=8);
    cylinder(r=3, h=12);
    cylinder(r=1.4, h=15); 
}