// DP parametric wheel
// May 2019. David Price
//
// parametric wheel for a polebot
// initial design is to fit gearmotor tyres
//
// v0.2,  190704 added tyre retention ribs
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
// tyre retention rib, offset from rim if greater than 0
rib_offset = 4;
rib_high = 1;
rib_wide = 1;

// derivations to make code simpler
$fn = 50;
dv_wheel_radius = diameter/2;
dv_rim_radius = dv_wheel_radius + rim_high;
dv_inside_radius = dv_wheel_radius - thick;

dv_hub_radius = hub_diameter/2;

dv_rib_radius = dv_wheel_radius + rib_high;

module wheel()
{
 difference() {
    union() {
        cylinder(r=dv_rim_radius, h=rim_wide);
        translate([0,0,rim_wide])
        cylinder(r=dv_wheel_radius, h=width-(rim_wide*2));
        translate([0,0,(width-rim_wide)])
        cylinder(r=dv_rim_radius, h=rim_wide);
        
        rib();

        }
    
    cylinder(r=dv_wheel_radius - thick, h=width);
    }
}

module rib() {
// if greater than zero add two ribs on the wheel to retain the tyre

if (rib_offset>0)
    {
        echo("rib offset is ", rib_offset);
 
        translate([0,0,rib_offset + rim_wide])
        cylinder(r=dv_rib_radius, h=rib_wide);
        translate([0,0,(width-rim_wide - (rib_offset + rib_wide))])
        cylinder(r=dv_rib_radius, h=rib_wide);
       
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