box_width = 48; // 30 milimeters (mm)
box_height = 20; // 20 mm
box_depth = 80; // 40 mm
wall_thickness = 1.6;

box();
fourPcbMounts(17.78, 45.72);
translate([-box_width -5, 0, 0]){
    lid();
}

module box() {
    difference() {
        cube([box_width, box_depth, box_height]); 
        // Everything below here will be subtracted
	 
        // Shape to remove from the above shape
        translate([wall_thickness, wall_thickness, wall_thickness]){
            // Use # in front of a shape to make it semi-transparent
            #cube([box_width - (wall_thickness * 2), box_depth - (wall_thickness * 2), box_height]);
        }
        
        // Micro usb slot
        #translate([14.79,-1,7.1])cube([8.2,4,4]);
    }
}

module lid() {
    cube([box_width, box_depth, wall_thickness]);
    translate([wall_thickness, wall_thickness, 0]){
        // Use # in front of a shape to make it semi-transparent
        cube([box_width - (wall_thickness * 2), box_depth - (wall_thickness * 2), (wall_thickness * 2.5)]);
    }
}

module pcbMount() {
    cylinder( h = 6, r = 3);
    cylinder( h = 10, r = 2);
    cylinder( h = 12, r = 1.1);
}

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
