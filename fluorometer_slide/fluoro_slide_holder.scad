// Microscope slide holder for RF-6000 Spectrofluorophotometer

// Units are mm
// Parameters
slide_depth = 1; // Thickness of slide
stage_bottom = 12.5; // location of start of cut, 
//slide_bottom = 8.5; // where slide will rest
slide_width = 25; // in this case, it will be the height, slides are about 25 mm wide, but larger will allow the slide to move around
stage_thick = 2; // how thick the stage bottom layer is

post_width = 24; // square base
post_height = 6;
arm_height = stage_thick+(0.15*slide_width);

shroud_thickness = 3;
notch = 5;

tolerance = 0.2; // for gaps to allow slide to pass

// Derived parameters
hypotenuse = ((2*(post_width^2))^(0.5));

union() {
    // Mounting Post
    translate([0, 0, 0])
    rotate([0,0,45])
    cube([post_width, post_width, post_height]);
        
    difference() {
        // Stage
        rotate([0, 0, 0])
        translate([-3*slide_depth, -5, stage_bottom-stage_thick])
        cube([4*slide_depth, 5+hypotenuse+5, arm_height]);
        
        // Cutting out the stage
        rotate([0,0,0])
        translate([-slide_depth-(2*tolerance),-5-1,stage_bottom])
        cube([slide_depth+(2*tolerance),6+hypotenuse+6,(tolerance+slide_width)]); // leading +1 are for extra
        
        // Cutting out the viewing area
        translate([-post_width/2, 0, post_height])
        cube([post_width, hypotenuse, hypotenuse]);
    };
    difference(){
        union(){
            // Support post
            translate([-slide_depth, 5*slide_depth, post_height-1])
            rotate([45, 0, 0])
            cylinder(h = (1+stage_bottom-post_height)/sin(45), r = 2*slide_depth);
    
            // Support post
            translate([-slide_depth, hypotenuse-(5*slide_depth), post_height-1])
            rotate([315, 0, 0])
            cylinder(h = (1+stage_bottom-post_height)/sin(45), r = 2*slide_depth);
        };
        // Cutting out the stage... again
        rotate([0,0,0])
        translate([-slide_depth-(2*tolerance),-5-1,stage_bottom])
        cube([slide_depth+(2*tolerance),6+hypotenuse+6,(tolerance+slide_width)]); // leading +1 are for extra
    };
    
    // Label back
    rotate([0, 0, 45])
    translate([0.5*post_width, 0.9*post_width, post_height])
    linear_extrude(height = 0.3)
    text("LEFT", size = 3, font = "Arial:style=Bold", halign = "center", valign = "center");
}