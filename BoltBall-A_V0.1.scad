// Trying to be a trekking pole camera mount
// For now, testing a 2 piece ball to contain a 1/4" (7/16" hex head) bolt
// jellsworth Dec 2014
//

use <Libs.scad>;

// units = inches
// scale to mm for printing
scale([25.4, 25.4, 25.4]) {

// Create top half of ball
translate([0.5, 0, 0]){
	difference() {
		sphere(3/8, $fn=40);
		hexbolt();
		translate([0, 0, -0.5]) {
			cube([1, 1, 1], true);
		}
	} // end difference block
} // end of top ball half

// Create bottom half of ball
rotate([180, 0, 0]) {
	translate([-0.5, 0, 0]){
		difference() {
			sphere(3/8, $fn=40);
			hexbolt();
			translate([0, 0, 0.5]) {
				cube([1, 1, 1], true);
			}
		} // end difference block
	}
} // end of top ball half
	
} // end scale block

module hexbolt(boltDiam=1/4, hexSize=7/16, boltLen=2, headThick=3/16) {
	
	union() {
		cylinder(h = boltLen, d=boltDiam, $fn=30);
		hex(hexSize, headThick, true, true );
	}

}
