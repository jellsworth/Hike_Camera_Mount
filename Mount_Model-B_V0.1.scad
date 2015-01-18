// Trying to be a trekking pole camera mount
// jellsworth Dec 2014
//
// units = inches



difference() {
	union(){
		// base block
		cube([ 5, 2, 1.5 ], false);

		// add strap supports
		difference() {
			// add strap base
			translate( [2.7, -0.5, 0.5]) {
				cube([ 1, 3, 0.25]);
			}
			
			// cut strap holes
			translate([2.95, -0.2, 0]){
				rotate([90, 0, 0]) {
					cube([0.5, 2, 0.1], false);
				}
			}
			translate([2.95, 2.25, 0]){
				rotate([90, 0, 0]) {
					cube([0.5, 2, 0.1], false);
				}
			}
		}
	}



	// remove wedge
	translate([ 0, 0, 0.7]) {
		rotate([ 0, -10, 0]) {
			cube([ 6, 2, 1 ], false);
		}
	}

	// remove cross-cut
	translate([ 1, -0.5, 0]) {
		cube([ 3, 3, 0.25 ], false);
	}


	// remove pole channel 1
	translate([ 0, 1, -0.25]) {
		rotate([ 0, 90, 0]) {
			cylinder(h = 6, r1 = 0.5, r2 = 0.7, center = false, $fn=30);
		}
	}

	// remove pole channel 2
	translate([ -0.2, 1, 1]) {
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
	translate([3.5, 0.5, 0]){
		cube([ 1, 1, 1]);
	}
	
	//reduce volume
	// lower block - bottom row
	translate([2.5, -0.5, 0.5]){
		vhole();
	}
	translate([2, -0.5, 0.5]){
		vhole();
	}
	translate([1.5, -0.5, 0.5]){
		vhole();
	}
	translate([1, -0.5, 0.5]){
		vhole();
	}
	translate([0.5, -0.5, 0.5]){
		vhole();
	}
	// lower block - upper row
	translate([2.5, -0.5, 0.85]){
		vhole();
	}
	translate([2, -0.5, 0.8]){
		vhole();
	}
	translate([1.5, -0.5, 0.75]){
		vhole();
	}
	translate([1, -0.5, 0.7]){
		vhole();
	}
	// upper block - bottom row
	translate([4.1, -0.5, 0.5]){
		vhole();
	}
	translate([4.6, -0.5, 0.5]){
		vhole();
	}
	// upper block - middle row
	translate([4.1, -0.5, 0.8]){
		vhole();
	}
	translate([4.6, -0.5, 0.8]){
		vhole();
	}
	// upper block - top row
	translate([4.1, -0.5, 1.1]){
		vhole();
	}
	translate([4.6, -0.5, 1.15]){
		vhole();
	}
	translate([3.6, -0.5, 1.05]){
		vhole();
	}
	translate([3.06, -0.5, 0.96]){
		vhole();
	}
}

module vhole() {
		rotate([-90, 0, 0]){
			cylinder(h = 3, d=0.2, $fn=5);
		}
}



