// Trying to be a trekking pole camera mount
// jellsworth Dec 2014
//
// units = inches


union() {
	difference() {
	
		// base block
		cube([ 5, 2, 1 ], false);
	
		// remove wedge
		translate([ 0, 0, 0.25]) {
			rotate([ 0, -11, 0]) {
				cube([ 5, 2, 1 ], false);
			}
		}
	
		// remove pole channel
		translate([ 0, 1, -0.25]) {
			rotate([ 0, 90, 0]) {
				cylinder(h = 6, r1 = 0.5, r2 = 0.5, center = false, $fn=30);
			}
		}
		//cut hole for bolt
		//1/4" - 20 x 3/4" (w/ 7/16" head)
		translate([4.5, 1, 0]){
			cylinder(h = 0.75, d=7/16, $fn=6);
			cylinder(h = 1.5, d=1/4, $fn=30);
		}
	}

	difference() {
		// add strap supports
		translate( [3, -0.5, 0.4]) {
			cube([ 1, 3, 0.25]);
		}
		
		// cut strap holes
		translate([3.25, -0.2, 0]){
			rotate([90, 0, 0]) {
				cube([0.5, 2, 0.1], false);
			}
		}
		translate([3.25, 2.25, 0]){
			rotate([90, 0, 0]) {
				cube([0.5, 2, 0.1], false);
			}
		}
	}

}


