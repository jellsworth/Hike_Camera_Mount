// Trying to be a trekking pole camera mount
// jellsworth Dec 2014
//
// units = inches



difference() {
	union(){
		// base block
		translate([0, 0, 0]) {
			cube([ 2, 2, 1.5 ], false);
		}

		// add strap supports
		difference() {
			// add strap base
			// center with bolt hole
			translate( [0.65, -0.375, 0.5 + 1/8]) {
				cube([ 0.75, 2.75, 0.25]);
			}
			
			// cut strap holes
			translate([0.75, -0.2, 0]){
				cube([0.5, 0.1, 2], false);
			}
			translate([0.75, 2.2, 0]){
				cube([0.5, 0.1, 2], false);
			}
		}
	}



	// remove wedge
	translate([ 0, 0, 1]) {
		rotate([ 0, -12, 0]) {
			cube([ 3, 2, 1 ], false);
		}
	}

	// remove cross-cut
	translate([ 0.5, -0.5, 0]) {
		cube([ 1, 3, 0.25 ], false);
	}


	// remove pole channel 1
	translate([ 0, 1, -0.25]) {
		rotate([ 0, 90, 0]) {
			cylinder(h = 6, r1 = 0.5, r2 = 0.7, center = false, $fn=30);
		}
	}

	// remove pole channel 2
	translate([ -3.2, 1, 0.7]) {
		rotate([ 0, 80, 0]) {
			cylinder(h = 6, r1 = 0.5, r2 = 0.4, center = false, $fn=30);
		}
	}


	//cut hole for bolt
	//1/4" - 20 x 3/4" (w/ 7/16" head)
	translate([1, 1, 0.75]){
		rotate([0, 90, 0]){
			cylinder(h = 0.75, d=7/16, $fn=6);
			cylinder(h = 1.5, d=1/4, $fn=30);
		}
	}

	//cut bolt access
	translate([0.75, 0.5, 0]){
		cube([ 0.75, 1, 0.8]);
	}
	
	//reduce volume
	// bottom row
	vhole(1.75, 0.4);
	vhole(1.25, 0.4);
	vhole(0.75, 0.4);
	vhole(0.25, 0.4);

	//  middle row
	vhole(1.75, 0.7);
	vhole(0.25, 0.7);

	//  top row
	vhole(1.75, 1);

	//endwise holes
	//bottom
	vhole2(0.25, 0.4);
	vhole2(0.75, 0.4);
	vhole2(1.25, 0.4);
	vhole2(1.75, 0.4);

	//top
	vhole2(0.25, 0.7);
	vhole2(1.75, 0.7);


}

// create cross-holes to reduce volume
module vhole(hx,hz,diam=0.2) {
	translate([hx, -0.5, hz]){
		rotate([-90, 0, 0]){
			cylinder(h = 3, d=diam, $fn=5);
		}
	}
}

// create lengthwise holes to reduce volume
module vhole2(hy,hz,diam=0.2) {
	translate([-0.5, hy, hz]){
		rotate([0, 90, 0]){
			cylinder(h = 3, d=diam, $fn=5);
		}
	}
}

