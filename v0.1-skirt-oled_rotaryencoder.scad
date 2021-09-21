bezel = 0.4;
bezel_h = calculate_bezel(bezel);
screen_bezel = 3.6;
screen_bezel_h = calculate_bezel(screen_bezel);
prototype = false;

standoff_screw_diameter = 2.1;
standoff_outer_diameter = standoff_screw_diameter + 2;


OLED_HOLE_SPACE_W = 21.0; 
OLED_HOLE_SPACE_H = 21.8;

OLED_X = (27.5+5+2)/2;

OFS_X = 16;

/*
translate([0,0, bezel+2.6])
    oled_proxy();
difference() {
    translate([0, 0, bezel])
        oled_holder_positive();
    translate([0,0, 2])
        oled_holder_negative();
}
*/

// rotary_encoder_holder();

/*
translate([OLED_X,(27.8+6+2-bezel)/2 +0.5, bezel+2.6])
        oled_proxy();
*/

difference() {
    union() {
        stock_skirt();
        translate([OFS_X,0,0,]) {
            translate([OLED_X, (27.8+6+2-bezel)/2 +0.5, bezel])
                oled_holder_positive();
            translate([41.2,18.5, 0])
                rotary_encoder_holder();
        }    
    }
    translate([OFS_X,0,0]) {
        translate([OLED_X, 2.6+31/2, 2])
            oled_holder_negative();
        if (prototype) {
            translate([OLED_X+35, -10, -10])
                cube([100,70,50]); 
            mirror([1,0,0])
            translate([OLED_X+25, -10, -10])
                cube([100,50,50]);
        }
        translate([OLED_X-30,1,-0.01])
            scale([0.5, 0.5, 1])
                import("Cowling_LOGO_ONLY_x1.STL");
    }
}

module stock_skirt() {
//    translate([-110,-41.5,0])
//        import("Skirt_x3.STL");

    mirror([1,0,0])
        translate([-110,-41.5,0])
            import("Skirt_x3.STL");
}

module rotary_encoder_holder() {

    difference() {
        
        // 六角柱
        order = 6;
        r=17/2;
        angles=[ for (i = [0:order-1]) i*(360/order) ];
        coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
        linear_extrude(height=5.0)
            rotate([0,0,30])
            color("blue")
            polygon(coords);

        // 穴
        cylinder(h=6, r=7.4/2, $fn=20);
        
        // 切り欠き
        translate([-6,0,5.0])
            cube([0.6*2,2.4,2.0*2], center=true);
    }
    
}


module oled_proxy() {
    
    translate([-OLED_HOLE_SPACE_W/2-2,-OLED_HOLE_SPACE_H/2-2,0]) {
        
        translate([0.5,4.0,-2])
            color("black")
                cube([24,13.5,2]);
        difference() {
            color("green")
                cube([OLED_HOLE_SPACE_W+2*2, OLED_HOLE_SPACE_H+2*2, 1.6]);
            translate([2,2,-0.4])
                cylinder(d = standoff_screw_diameter, h=2, $fn=30);
            translate([2,2+OLED_HOLE_SPACE_H,-0.4])
                cylinder(d = standoff_screw_diameter, h=2, $fn=30);
            translate([2+OLED_HOLE_SPACE_W,2+OLED_HOLE_SPACE_H,-0.4])
                cylinder(d = standoff_screw_diameter, h=2, $fn=30);
            translate([2+OLED_HOLE_SPACE_W,2,-0.4])
                cylinder(d = standoff_screw_diameter, h=2, $fn=30);

        }
    }
}

module oled_holder_positive() {
    translate([-(27.5+5+2)/2, -(27.8+6+2)/2,0]) {
        minkowski() {
            cube([27.5+5+2-bezel_h, 27.8+6+2-bezel, 3-2*bezel]);
            rotate([0,45,0])
                cube([bezel_h,bezel_h,bezel_h]);
        }
    }
    translate([-OLED_HOLE_SPACE_W/2,-OLED_HOLE_SPACE_H/2,2])
        screen_standoff();
    translate([-OLED_HOLE_SPACE_W/2,+OLED_HOLE_SPACE_H/2,2])
        screen_standoff();
    translate([+OLED_HOLE_SPACE_W/2,-OLED_HOLE_SPACE_H/2,2])
        screen_standoff();
    translate([+OLED_HOLE_SPACE_W/2,+OLED_HOLE_SPACE_H/2,2])
        screen_standoff();
}

module oled_holder_negative() {
    difference() {
        union() {
            translate([-28.5/2,-31/2,-1])
            cube([28.5, 31, 10]); // PCB cutout
            translate([-OLED_HOLE_SPACE_W/2,-OLED_HOLE_SPACE_H/2,-1])
                cylinder(d = standoff_screw_diameter, h = 4, $fn = 30);
            translate([-OLED_HOLE_SPACE_W/2,OLED_HOLE_SPACE_H/2,-1])
                cylinder(d = standoff_screw_diameter, h = 4, $fn = 30);
            translate([OLED_HOLE_SPACE_W/2,-OLED_HOLE_SPACE_H/2,-1])
                cylinder(d = standoff_screw_diameter, h = 4, $fn = 30);
            translate([OLED_HOLE_SPACE_W/2,OLED_HOLE_SPACE_H/2,-1])
                cylinder(d = standoff_screw_diameter, h = 4, $fn = 30);
        }
        translate([-OLED_HOLE_SPACE_W/2,-OLED_HOLE_SPACE_H/2,-2])
            screen_standoff();
        translate([-OLED_HOLE_SPACE_W/2,OLED_HOLE_SPACE_H/2,-2])
            screen_standoff();
        translate([OLED_HOLE_SPACE_W/2,-OLED_HOLE_SPACE_H/2,-2])
            screen_standoff();
        translate([OLED_HOLE_SPACE_W/2,OLED_HOLE_SPACE_H/2,-2])
            screen_standoff();
    }
    // Screen cutout
    translate([-28.5/2,-31/2-0.2,0]) {
        translate([4.5/2-screen_bezel,7.1,-12]) {
            minkowski() {
                cube([24-screen_bezel_h,13.5-screen_bezel_h,0.3]);
                minkowski() {
                rotate([0,45,0])
                    cube(screen_bezel_h);
                rotate([45,0,0])
                    cube(screen_bezel_h);
                }
            }
        }
    }
}

module screen_standoff() {
    difference() {
        cylinder(d = standoff_outer_diameter, h = 3, $fn = 30);
        cylinder(d = standoff_screw_diameter, h = 4, $fn = 30);
    }
}

function calculate_bezel(bezel) = ((bezel*bezel)*2)^0.5;
