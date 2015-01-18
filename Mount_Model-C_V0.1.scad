// Trying to be a trekking pole camera mount
// jellsworth Dec 2014
//
// units = inches



difference() {
	union(){
		// base block
		translate([3, 0, 0]) {
			cube([ 2, 2, 1.5 ], false);
		}

		// add strap supports
		difference() {
			// add strap base
			translate( [3.65, -0.375, 0.5]) {
				cube([ 0.75, 2.75, 0.25]);
			}
			
			// cut strap holes
			translate([3.75, -0.2, 0]){
				cube([0.5, 0.1, 2], false);
			}
			translate([3.75, 2.2, 0]){
				cube([0.5, 0.1, 2], false);
			}
		}
	}



	// remove wedge
	translate([ 3, 0, 1]) {
		rotate([ 0, -12, 0]) {
			cube([ 3, 2, 1 ], false);
		}
	}

	// remove cross-cut
	translate([ 3.5, -0.5, 0]) {
		cube([ 1, 3, 0.25 ], false);
	}


	// remove pole channel 1
	translate([ 0, 1, -0.25]) {
		rotate([ 0, 90, 0]) {
			cylinder(h = 6, r1 = 0.5, r2 = 0.7, center = false, $fn=30);
		}
	}

	// remove pole channel 2
	translate([ -0.2, 1, 0.7]) {
		rotate([ 0, 80, 0]) {
			cylinder(h = 6, r1 = 0.5, r2 = 0.4, center = false, $fn=30);
		}
	}


	//cut hole for bolt
	//1/4" - 20 x 3/4" (w/ 7/16" head)
	translate([4, 1, 0.75]){
		rotate([0, 90, 0]){
			cylinder(h = 0.75, d=7/16, $fn=6);
			cylinder(h = 1.5, d=1/4, $fn=30);
		}
	}

	//cut bolt access
	translate([3.75, 0.5, 0]){
		cube([ 0.75, 1, 0.8]);
	}
	
	//reduce volume
	// upper block - bottom row
	translate([4.75, -0.5, 0.4]){
		vhole();
	}
	// upper block - middle row
	translate([4.75, -0.5, 0.7]){
		vhole();
	}
	// lower block - bottom row
	translate([3.25, -0.5, 0.4]){
		vhole();
	}
	// lower block - middle row
	translate([3.25, -0.5, 0.7]){
		vhole();
	}


}

module vhole() {
		rotate([-90, 0, 0]){
			cylinder(h = 3, d=0.2, $fn=5);
		}
}



