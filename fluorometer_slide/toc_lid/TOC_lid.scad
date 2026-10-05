// Beaker Cover with Capillary Clamp
// Units: millimeters
//
// Designed for:
//   Cover: 100 mm diameter x 10 mm thick
//   Post: 20 x 20 x 20 mm
//   Capillary: 2 mm diameter
//   Screw: M4 x 0.7 x 12 mm
//   Nut: 7 x 7 x 3.2 mm square nut
//
// PLA / 0.4 mm nozzle starting point
//
// Initial design developed by ChatGPT (GPT-5.6 Luna), OpenAI.

$fn = 96;

// =============================
// PARAMETERS
// =============================

cover_diameter = 46;
cover_interior = 38;
cover_thickness = 10;

post_width  = 20;
post_depth  = 20;
post_height = 20;

capillary_diameter = 2.4;
// 2 mm diameter plus clearance 

// Square nut dimensions
nut_width  = 7;
nut_height = 3.2;

// Clearance for FDM printing
nut_clearance = 0.2;

// Position of screw above cover
screw_height = 10;

// Nut pocket bottom above cover
nut_pocket_bottom = cover_thickness + (post_height/2) - (nut_width/2);

// =============================
// DERIVED DIMENSIONS
// =============================

nut_pocket_width =
    nut_width + nut_clearance;

nut_pocket_height =
    nut_height + nut_clearance;


// =============================
// MAIN COVER
// =============================

difference() {

    // Cover + post
    union() {

        // Circular cover
        cylinder(
            d = cover_diameter,
            h = cover_thickness
        );
        
        // Circular interior
        translate([
            0,
            0,
            -cover_thickness/2
        ])
        cylinder(
            d = cover_interior,
            h = cover_thickness/2
        );

        // Square post
        translate([
            -post_width/2,
            -post_depth/2,
            cover_thickness
        ])
        cube([
            post_width,
            post_depth,
            post_height
        ]);
    }


    // =========================
    // CENTRAL CAPILLARY HOLE
    // =========================

    translate([0, 0, -(cover_thickness/2)-1])
    cylinder(
        d = capillary_diameter,
        h = (1.5 * cover_thickness) + post_height + 2
    );


    // =========================
    // SQUARE NUT POCKET
    // =========================
    //
    // The pocket is OPEN AT THE TOP.
    // The nut drops vertically into it.
    //
    // The pocket is centered on the post.
    //

    translate([
        -((((post_width/2) - (capillary_diameter/2)) / 2) + (nut_pocket_width/2)),
        -nut_pocket_width/2,
        nut_pocket_bottom
    ])
    cube([
        nut_pocket_height,
        nut_pocket_width,
        (nut_pocket_width + 10)
    ]);


    // =========================
    // SCREW ACCESS HOLE
    // =========================
    //
    // Horizontal M4 screw passage.
    //
    // This hole goes from the outside
    // of the post toward the nut pocket.
    //
    // The nut itself provides the threads.

    translate([
        -post_width/2 - 1,
        0,
        cover_thickness + screw_height
    ])
    rotate([0, 90, 0])
    cylinder(
        d = 4.3,
        h = (capillary_diameter + post_width)/2 + 1
    );
}
