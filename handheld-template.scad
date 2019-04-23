$fn = 64; // curved resolution (used for cylinders and spheres)
enclosure_height = 55;
enclosure_length = 90;
enclosure_width = 15;

lipoSlim();
//lipoCylinder();


difference() {
    glareProtection();
    
    handheld();
}

module lipoCylinder() {
    translate([7,4,12]) {
        rotate(90, [-1,0,0]) {
            rotate(4, [0,1,0]) {
                cylinder(r=9.35, h=71);
            }
        }
    }
}

module lipoSlim() {
    //50.8 x 33.5 x 5.9 mm
    translate([0,2,4]) {
        rotate(90, [1,0,0]) {
            rotate(88, [0,1,0]) {
                cube([50.8, 33.5, 5.9]);
            }
        }
    }
}

module handheld() {
    #minkowski() {
        linear_extrude(height = enclosure_height, center = false, convexity = 10, twist = 0) {
            triangle_points =[[0,0],[enclosure_width,2],[enclosure_width + 5,enclosure_length],[2,enclosure_length - 2]];
            triangle_paths =[[0,1,2,3]];
            polygon(triangle_points,triangle_paths,10);
        }
        sphere(r=2.8);
    }
}
module glareProtection() {
    difference() {
        translate([0.5,0,-3]) {
            minkowski() {
                linear_extrude(height = enclosure_height + 6, center = false, convexity = 10) {
                    triangle_points = [
                        [-2,enclosure_length-15],
                        [enclosure_width + 6,enclosure_length-15],
                        [enclosure_width + 8,enclosure_length + 10],
                        [-1,enclosure_length + 3]
                    ];
                    triangle_paths = [[0,1,2,3]];
                    polygon(triangle_points,triangle_paths,10);
                }
                sphere(r=1);
            } 
        }
        translate([0,0,-1]) {
            minkowski() {
                linear_extrude(height = enclosure_height + 2, center = false, convexity = 10) {
                    triangle_points = [
                        [3,enclosure_length-15],
                        [enclosure_width,enclosure_length-20],
                        [enclosure_width + 6,enclosure_length + 11],
                        [1,enclosure_length + 4]
                    ];
                    triangle_paths =[[0,1,2,3]];
                    polygon(triangle_points,triangle_paths,10);
                }
                sphere(r=1);
            }
        }
    }
}