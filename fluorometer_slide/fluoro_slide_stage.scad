// Microscope slide holder for RF-6000 Spectrofluorophotometer

// Units are mm
// Parameters
slide_depth = 1; // Thickness of slide
stage_bottom = 12.5; // location of start of cut, 
slide_bottom = 8.5; // where slide will rest
slide_width = 35; // in this case, it will be the height, slides are about 25 mm wide, but larger will allow the slide to move around

post_width = 24; // square base
post_height = 50;

shroud_thickness = 3;
notch = 5;

tolerance = 0.2; // for gaps to allow slide to pass

// Derived parameters
hypotenuse = ((2*(post_width^2))^(0.5));

difference() {
    rotate([0,0,45])
    cube([post_width, post_width, post_height]);

    // Cutting out the stage
    rotate([0,0,0])
    translate([-(slide_depth+(2*tolerance)),0,slide_bottom]) // leave a base
    cube([slide_depth+(3*tolerance),1+hypotenuse,(tolerance+slide_width)]); // leading +1 are for extra
    
    // cut off the top
    rotate([0,0,0])
    translate([0,0,stage_bottom]) // leave a base
    cube([1+hypotenuse/2,1+hypotenuse,(1+post_height-slide_bottom)]); // leading +1 are for extra
    
    // notch for shroud
    rotate([0,0,0])
    translate([0,0,stage_bottom-notch])
    cube([shroud_thickness+tolerance,1+hypotenuse,(tolerance+slide_width)]); // leading +1 are for extra
}