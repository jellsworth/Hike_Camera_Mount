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
		sphere(3/8, $fn=50);
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
			sphere(3/8, $fn=50);
			hexbolt();
			translate([0, 0, 0.5]) {
				cube([1, 1, 1], true);
			}
		} // end difference block
	}
} // end of top ball half
	
// just to visualize bolt
translate([0, 0.5, (7/16 + 1/64)/2 + (1/4)/2]) {
	hexbolt();
}


} // end scale block

module hexbolt(boltDiam=1/4 + 1/64, hexSize=7/16 + 1/64, boltLen=1, headThick=1/4) {
	
	union() {
		cylinder(h = boltLen, d=boltDiam, $fn=30);
		hex(hexSize, headThick, true, true );

		//create slopes to (try) to avoid need for support mat'l
		difference() {
			translate([0, 0, -headThick/2]) {
				sphere(hexSize/2, $fn=20);
			}
			translate([0, 0, hexSize/2]){
				cube(hexSize, center=true);
			}
		}

		difference() {
			translate([0, 0, headThick/2]) {
				sphere(hexSize/2, $fn=20);
			}
			translate([0, 0, -hexSize/2]){
				cube(hexSize, center=true);
			}
		}


	}

}
