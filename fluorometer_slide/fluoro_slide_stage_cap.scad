// Microscope slide holder for RF-6000 Spectrofluorophotometer
// top cap

// Units are mm
// Parameters
base_height = 0; // top to bottom of the instrument, z
stage_base = 2; // z location of bottom of stage cut
post_width = 24; // square base
post_height = 7;

stage_d = 2;
shroud_thickness = 3;

tolerance = 0.2; // for gaps to allow slide to pass
hypotenuse = ((2*(post_width^2))^(0.5));

difference() {
    // Holder
    rotate([0,0,0])
    translate([0, 0, base_height])
    cube([post_width+(2*stage_d), post_width+(2*stage_d), post_height]);
    
    difference() {
        // Cutting out the stage
        rotate([0,0,0])
        translate([stage_d, stage_d, stage_base])
        cube([post_width+tolerance,post_width+tolerance, post_height]);
        
        // Remove the corner
        rotate([0, 0, 45])
        translate([0, (shroud_thickness+tolerance), -1])
        cube([2*hypotenuse, 2*hypotenuse, 2+stage_base+post_height]);
    }
}
