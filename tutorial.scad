// INTRO TO OpenSCAD

// Code comments start with //
// Multiline comments are wrapped with /* and */

/*
    VARIABLES
    https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/General
    
    Variables are used to store values for later use
*/

box_width = 30; // 30 milimeters (mm)
box_height = 20; // 20 mm

// Create a variable box_depth and set it equal to 40

/*
    SOLID SHAPES
    https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
*/

// CUBE [ width, depth, height]
//cube([box_width, box_depth, box_height]); 

// SPHERE where r is the radius in mm
//sphere(r = 20);

// CYLINDER where h is the height and r is the radius in mm
//cylinder( h = 30, r = 20);

// Increase the resolution of curved edges by assigning $fn to a value.
//$fn = 24; // try using changing this to 10, 24, 48 or 64

/*
    TRANSLATION
    Move objects in 3D space.
*/

// Move [ x, y , z ]
translate([20, -20, 0]) {
    // Everything inside the { } will be translated
    //cylinder( h=30, r=20);
}

// Try translating all of the shapes from above so that none of them overlap



// NOTE: Comment out the shapes above before moving on

/*
    DIFFERENCE
    Remove part of a solid shape.
*/

difference() {
    // Shape
    //cube([38, 60, 13]);

    // Shape to remove from the above shape
    translate([1.6, 1.6, 2]){
        // Use # in front of a shape to make it semi-transparent
        //#cube([34.8,76.8,24]);
    }
    
    // Micro usb slot
    //translate([14.79,-1,7.1])cube([8.2,4,3.5]);
}

/*
    MODULES
    Modules allow us to reuse shapes we've created.
*/

module pcbMount() {
    cylinder( h = 10, r = 3);
    cylinder( h = 12, r = 1.1);
}

// We can render a module by calling it.
//pcbMount();

module fourPcbMounts(pcb_width, pcb_depth) {
    translate([10,4.3,0]) {
        pcbMount();
    }
    translate([10 + pcb_width,4.3,0]) {
        pcbMount();
    }
    translate([10 + pcb_width,4.3 + pcb_depth,0]) {
        pcbMount();
    }
    translate([10,4.3 + pcb_depth,0]) {
        pcbMount();
    }
}

//fourPcbMounts(17.78, 45.72);