// Easy change stage for RF-6000 Spectrofluorophotometer

// Units are mm
// Parameters
base_width = 90; // left to right of the instrument, x
base_length = 111; // front to back of the instrument, y
base_height = 5; // top to bottom of the instrument, z
stage_base = 10; // z location of bottom of stage cut
post_width = 24; // square base
post_height = 10;

stage_x = 48;
stage_y = 65.5;
stage_d = 2;
xcorner = stage_x-stage_d; // location of mount cut
ycorner = stage_y-stage_d;

tolerance = 0.2; // for gaps to allow slide to pass

difference() {
    union() {
        rotate([0,0,0])
        translate([0,0,0])
        cube([base_width, base_length, base_height]);
        
        // Holder
        rotate([0,0,0])
        translate([xcorner,ycorner,base_height])
        cube([post_width+(2*stage_d), post_width+(2*stage_d), post_height]);
    }
    
    // Right anchor hole
    rotate([0,0,0])
    translate([80,13.3,-1])
    cylinder(h = 2+base_height, d = 6.38);
    
    // Left anchor hole
    rotate([0,0,0])
    translate([9.8,13.3,-1])
    cylinder(h = 2+base_height, d = 6.38);
    
    // Mounting screw
    rotate([0,0,0])
    translate([45,8,-1])
    cylinder(h = 2+base_height, d = 5.5);
    
    // Cutting out the stage
    rotate([0,0,0])
    translate([stage_x,stage_y,stage_base])
    cube([post_width+tolerance,post_width+tolerance,post_height]);
}