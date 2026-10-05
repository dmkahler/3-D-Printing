// Microscope slide holder for RF-6000 Spectrofluorophotometer

// Units are mm
// Parameters
slide_depth = 1; // Thickness of slide
stage_bottom = 12.5; // location of start of cut, 
//slide_bottom = 8.5; // where slide will rest
slide_width = 25; // in this case, it will be the height, slides are about 25 mm wide, but larger will allow the slide to move around

post_width = 24; // square base
post_height = 6;

tol = 0.2; // tolerance for gaps to allow slide to pass

// Derived parameters
hypotenuse = ((2*(post_width^2))^(0.5));
union() {
    difference() {
        // Mounting Post
        translate([0, 0, 0])
        rotate([0,0,45])
        cube([post_width, post_width, post_height]);
        
        // Slide cutout
        translate([-(slide_depth+(2*tol)), (hypotenuse-slide_width-(2*tol))/2, -1])
        cube([slide_depth+(2*tol), slide_width+(2*tol), 2+post_height]);
    };
    
    // Removal post
    translate([-hypotenuse/2+1, (hypotenuse/2)-1, post_height-1])
    cube([5, 2, 4]);
    
    // Label back
    rotate([0, 0, 45])
    translate([0.5*post_width, 0.9*post_width, post_height])
    linear_extrude(height = 0.1)
    text("BACK", size = 2, font = "Arial:style=Bold", halign = "center", valign = "center");
}