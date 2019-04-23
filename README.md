# 3D Printed Enclosure Workshop

Does your IoT prototype have exposed wires? In this workshop we'll talk about how you can make your IoT project look more professional with an enclosure.

## What to bring?

- Laptop
- Pencil & paper
- A project idea

## Software & Prerequisites

- [OpenSCAD](http://www.openscad.org/)
- Cura (optional)
- Basic understanding of variables and functions is helpful but not required


## Tutorial

Start with the [tutorial.scad](tutorial.scad) file. There are instructions in the code comments. Example code can also be found commented out in that file. After going through the tutorial, choose one of the other templates as a starting point. 

- [box-template.scad](box-template.scad) (beginner)
- [circular-template.scad](circular-template.scad) (intermediate)
- [rounded-box-template.scad](rounded-box-template.scad) (intermediate)
- [camera-enclosure.scad](camera-enclosure.scad) (advanced)

#### VARIABLES

[Variables](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/General) are useful when you plan to re-use a value multiple times. You'll be able to update the value in one place and have it change everywhere in your project.

```
box_width = 30;
```

#### SOLID SHAPES

[Solid shapes](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids) are used to draw things in the 3D space. All numbers represent milimeters (mm) of printed material.

```
box_width = 30; // 30 milimeters (mm)
box_height = 20; // 20 mm
box_depth = 40; // 40 mm

cube([box_width, box_depth, box_height]); 
```

#### TRANSLATION

Translation is used to move shapes in 3D space. Without translation, all shapes would overlap in the center. Most projects are made up of multiple shapes at different positions.

```
// Move [ x, y , z ]
// Everything inside the { } will be translated
translate([20, -20, 0]) {
    cylinder( h=30, r=20);
}
```

#### DIFFERENCE

Difference is used to subtract one shape from another. By default OpenSCAD will completely fill the space of a shape. This generally isn't what we want. To create a hollow shape, you can take the difference of a shape and a slightly small shape. This is how we'll create our project enclosures.

```
difference() {
    // Shape
    cube([38, 60, 13]);
    // Everything below here will be subtracted
	 
    // Shape to remove from the above shape
    translate([1.6, 1.6, 2]){
        // Use # in front of a shape to make it semi-transparent
        #cube([34.8,76.8,24]);
    }
    
    // Micro usb slot
    #translate([14.79,-1,7.1])cube([8.2,4,4]);
}
```

We could use variables to make the above code easier to modify.

```
box_width = 30; // 30 milimeters (mm)
box_height = 20; // 20 mm
box_depth = 40; // 40 mm
wall_thickness = 1.6;

difference() {
    // Shape
    cube([box_width, box_depth, box_height]); 
    // Everything below here will be subtracted
	 
    // Shape to remove from the above shape
    translate([wall_thickness, wall_thickness, wall_thickness]){
        // Use # in front of a shape to make it semi-transparent
        #cube([box_width - (wall_thinkness * 2), box_depth - (wall_thickness * 2), box_height]);
    }
    
    // Micro usb slot
    #translate([14.79,-1,7.1])cube([8.2,4,4]);
}
```

#### MODULES

Modules behave like functions. They allow you to reuse code throughout your project. They make your code easier to read and maintain.

```
module pcbMount() {
    cylinder( h = 6, r = 3);
    cylinder( h = 10, r = 2);
    cylinder( h = 12, r = 1.1);
}

// We can render a module by calling it.
//pcbMount();

module fourPcbMounts(pcb_width, pcb_depth) {
    translate([10,4.65,0]) {
        pcbMount();
    }
    translate([10 + pcb_width,4.65,0]) {
        pcbMount();
    }
    translate([10 + pcb_width,4.65 + pcb_depth,0]) {
        pcbMount();
    }
    translate([10,4.65 + pcb_depth,0]) {
        pcbMount();
    }
}

//fourPcbMounts(17.78, 45.72);
```