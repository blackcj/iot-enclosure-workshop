// Global config variables
enclosure_height = 30;
enclosure_radius = 40;
wall_thickness = 1.6;
$fn = 48; // curved resolution (used for cylinders and spheres)

circular_base();

module circular_base() {
     difference() {
        rcube([enclosure_width,enclosure_length,enclosure_height], 10);

        cylinder(h = enclosure_height, r = enclosure_radius);
        // Make the cylinder hollow
        translate([0,0,wall_thickness]) {
            inner_height = enclosure_height;
            inner_radius = enclosure_radius - wall_thickness;
            #cylinder(h = inner_height, r = inner_radius);
        }
    }
    
}