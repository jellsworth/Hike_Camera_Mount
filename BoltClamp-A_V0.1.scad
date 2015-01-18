// Part of ball/clamp joint
// Use with a 2 piece ball to contain a 1/4" (7/16" hex head) bolt
// jellsworth Dec 2014
/*
Change log

0.1 Still in progress
*/

use <Libs.scad>;

// units = inches
// scale to mm for printing
scale([25.4, 25.4, 25.4]) {

//Create the plate with capture socket for bolt
translate([0, 3/4, 0]) {
	difference() {
		plate();
		translate([0, 0, 1/8]){
			rotate([180, 0, 0]){
				hexbolt();	
			}
		}
	} // end difference
} // end translate

// create the plate to house wingnut
translate([0, -3/4, 0]) {
	difference() {
		plate();
		translate([0, 0, 1/2]){
			rotate([180, 0, 0]){
				hexbolt();	
			}
		}
	} // end difference
} // end translate

// create the wingnut
translate([1.75, 0, 0]) {
	difference() {
		union(){
			intersection(){
				cube([3/4, 3/4, 1/4], center = true); // cross piece holds nut
				cylinder(h = 1, d=3/4, $fn=30, center = true);
			}
			translate([0, 0, 1/8]) cube([1/4, 1.5, 1/2], center = true); // upright wing
		} //end union
		translate([0, 0, 1/8]){
			rotate([180, 0, 360/12]){
				hexbolt();	
			}
		}
		
		// rounded cutouts
		translate([0, 0, 3/8 + 1/8]) {
			rotate([0, 90, 0]){
				cylinder(h = 1, d=3/4, $fn=30, center = true);
			}
		}
	} // end difference

} // end wingnut
} //end scale

module hexbolt(boltDiam=1/4 + 1/32, hexSize=7/16 + 1/32, boltLen=1, headThick=3/16) {
	
	union() {
		cylinder(h = boltLen, d=boltDiam, $fn=30);
		hex(hexSize, headThick, true, true );
	}
}

module plate() {

difference() {
	union(){
		cube([1, 1, 1/4], center = true); // center

		// one rounded end
		translate([0.5, 0, 0])
		linear_extrude(height=1/4, center = true, convexity = 10) circle(r=0.5, $fn=30);
		// another rounded end
		translate([-0.5, 0, 0])
		linear_extrude(height=1/4, center = true, convexity = 10) circle(r=0.5, $fn=30);
	
	} //end union
	//indentations
	translate([1/2, 0, -3/8]) sphere(3/8, $fn=50, center = true);
	translate([-1/2, 0, -3/8]) sphere(3/8, $fn=50, center = true);


} // end difference
} // end module



