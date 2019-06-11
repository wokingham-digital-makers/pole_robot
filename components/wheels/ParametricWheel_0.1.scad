// DP parametric wheel
// May 2019. David Price
//
// parametric wheel for a polebot
// initial design is to fit gearmotor tyres
//
// v0.1,  190611 initial design to test fit with tyres
//
// wheel parameters
diameter = 48;
width = 27;
thick = 3;
rim_high = 2;
rim_wide = 2;

// hub parameters
hub_inset = 10;
hub_height = 12;
hub_diameter = 12;

// derivations to make code simpler
$fn = 50;
dv_wheel_radius = diameter/2;
dv_rim_radius = dv_wheel_radius + rim_high;
dv_inside_radius = dv_wheel_radius - thick;

dv_hub_radius = hub_diameter/2;

module wheel()
{
 difference() {
    union() {
        cylinder(r=dv_rim_radius, h=rim_wide);
        translate([0,0,rim_wide])
        cylinder(r=dv_wheel_radius, h=width-(rim_wide*2));
        translate([0,0,(width-rim_wide)])
        cylinder(r=dv_rim_radius, h=rim_wide);
        }
    
    cylinder(r=dv_wheel_radius - thick, h=width);
    }
}

module hub()
{
    translate([0,0,width-hub_inset])
    cylinder(r=dv_hub_radius, h=hub_height);
}

module spokes()
{
}

wheel();
hub();