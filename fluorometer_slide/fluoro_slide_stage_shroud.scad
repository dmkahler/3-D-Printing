// Microscope slide holder for RF-6000 Spectrofluorophotometer
// slide shroud

// Units are mm
// Parameters
slide_depth = 1; // Thickness of slide
slide_bottom = 12.5; // location of start of cut, where slide will rest
slide_width = 25; // in this case, it will be the height

shroud_thickness = 3;
notch = 5;
window_width = 7;

post_width = 24; // square base
post_height = 50 + notch - slide_bottom;

tolerance = 0.2; // for gaps to allow slide to pass

// Derived parameters
hypotenuse = ((2*(post_width^2))^(0.5));

difference() {
    rotate([0,0,45])
    translate([0,0,0])
    cube([post_width, post_width, post_height]);
    
    // cut off the connection side
    rotate([0,0,0])
    translate([0,0,-1])
    cube([(1+hypotenuse/2),1+hypotenuse,(2+post_height)]); // leading +1 are for extra
    
    // cut off the extra
    rotate([0,0,90])
    translate([0,shroud_thickness,-1]) // leave a base
    cube([1+hypotenuse,1+hypotenuse,(2+post_height)]); // leading +1 are for extra
    
    // cut out the window
    translate([-2*shroud_thickness, 0, notch])
    rotate([0,0,45])
    cube([post_width, post_width, slide_width]);
}