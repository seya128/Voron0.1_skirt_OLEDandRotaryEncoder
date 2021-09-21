

//////////////////////////
// Customizable settings
//////////////////////////


// Diameter of the hole on the bottom (in mm).
// 底面の穴の直径（単位：mm）
HoleDiameter = 6.0 + 0.3;

// Depth of the hole in the bottom (in mm).  If you want the hole to go all the way through then set this to a number larger than the total height of the object.
// 底面に開ける穴の深さ（単位：mm）。 穴を完全に貫通させたい場合は、オブジェクトの全高よりも大きな数値を設定してください。
HoleDepth = 14;

// If you want a D-shaped hole, set this to the thickness of the flat side (in mm).  Larger values for the flat make the hole smaller.
// D型の穴にしたい場合は、平らな面の厚さ（単位：mm）を設定してください。 平面の値を大きくすると、穴が小さくなります。
HoleFlatThickness = 1.0;

Hole2Diameter = 7.5;
Hole2Depth = 4;

Hole3Diameter = 12.5;
Hole3Depth = 3;


// Height (in mm).  If dome cap is selected, it is not included in height.  The shaft length is also not counted.
// 高さ（単位：mm）。 ドームキャップを選択した場合、高さには含まれません。 シャフトの長さもカウントされません。
KnobHeight = 15;

// Diameter of base of round part of knob (in mm).  (Knurled ridges are not included in this measurement.)
// ノブの丸い部分の底面の直径（単位：mm）。 (ローレットの稜線はこの測定に含まれません）
KnobDiameter = 14;

// Shape of top of knob.  "Recessed" type can be painted.
// ノブの上部の形状。 「埋め込みタイプは塗装が可能です。
CapType = 0;	// [0:Flat, 1:Recessed, 2:Dome]

// Do you want a large timer-knob style pointer?
// タイマーノブのような大きなポインターが欲しい？
TimerKnob= 0;	// [0:No, 1:Yes]

// Would you like a divot on the top to indicate direction?
// トップに方向性を示すディボットを入れますか？
Pointer1 = 0;	// [0:No, 1:Yes]

// Would you like a line (pointer) on the front to indicate direction?
// フロントに方向を示すライン（ポインター）が欲しいですか？
Pointer2 = 0;	// [0:No, 1:Yes]

// Do you want finger ridges around the knob?
// ノブの周りに指の隆起が必要ですか？
Knurled = 1;	// [0:No, 1:Yes]

// 0 = A cylindrical knob, any other value will taper the knob.
// 0 = 円筒形のノブ、それ以外の値ではノブが細くなります。
TaperPercentage = 15;		// [0:0%, 10:10%, 20:20%, 30:30%, 40:40%, 50:50%]

// Width of "dial" ring (in mm).  Set to zero if you don't want the ring.
// ダイヤル "リングの幅（単位：mm）。 リングが不要な場合はゼロに設定してください。
RingWidth = 2;

// The number of markings on the dial.  Set to zero if you don't want markings.  (RingWidth must be non-zero.)
// ダイヤル上のマーキングの数。 マークを付けたくない場合はゼロに設定します。 (RingWidthは0以外でなければならない)
RingMarkings = 0;

// diameter of the hole for the setscrew (in mm).  If you don't need a hole, set this to zero.
// 止めねじの穴の直径（単位：mm）。 穴が必要ない場合は、0に設定してください。
ScrewHoleDiameter = 0;

// Length of the shaft on the bottom of the knob (in mm).  If you don't want a shaft, set this value to zero.
// ノブの底面にあるシャフトの長さ（単位：mm）。 シャフトが不要な場合は、この値をゼロにしてください。
ShaftLength = 0;

// Diameter of the shaft on the bottom of the knob (in mm).  (ShaftLength must be non-zero.)
// ノブの下部にあるシャフトの直径（単位：mm）。 (ShaftLengthは0以外でなければなりません)
ShaftDiameter = 10;

// Would you like a notch in the shaft?  It can be used for a press-on type knob (rather than using a setscrew).  (ShaftLength must be non-zero.)
// 軸に切り込みを入れますか？ プレスオンタイプのノブに使用できます（止めねじを使用するのではなく）。 (ShaftLengthは0以外でなければなりません。)
NotchedShaft = 0;	// [0:No, 1:Yes]



//////////////////////////
//Advanced settings
//////////////////////////

RingThickness = 5*1;
DivotDepth = 1.5*1;
MarkingWidth = 1.5*1;
DistanceBetweenKnurls = 2*1;
TimerKnobConst = 1.8*1;



//////////////////////////
//Calculations
//////////////////////////

PI=3.14159265*1;
KnobMajorRadius = KnobDiameter/2;
KnobMinorRadius = KnobDiameter/2 * (1 - TaperPercentage/100);
KnobRadius = KnobMinorRadius + (KnobMajorRadius-KnobMinorRadius)/2;
KnobCircumference = PI*KnobDiameter;
Knurls = round(KnobCircumference/DistanceBetweenKnurls);
Divot=CapType;

TaperAngle=asin(KnobHeight / (sqrt(pow(KnobHeight, 2) +
		pow(KnobMajorRadius-KnobMinorRadius,2)))) - 90;

DivotRadius = KnobMinorRadius*.4;


union()
{
translate([0, 0, (ShaftLength==0)? 0 : ShaftLength-0.001])
difference()
{
union()
{
	// Primary knob cylinder
	cylinder(h=KnobHeight, r1=KnobMajorRadius, r2=KnobMinorRadius,
			$fn=50);
	
	if (Knurled)
		for (i=[0 : Knurls-1])
			rotate([0, 0, i * (360/Knurls)])
				translate([KnobRadius, 0, KnobHeight/2])
					rotate([0, TaperAngle, 0]) rotate([0, 0, 45])
						cube([2, 2, KnobHeight+.001], center=true);

 	if (RingMarkings>0)
		for (i=[0 : RingMarkings-1])
			rotate([0, 0, i * (360/RingMarkings)])
				translate([KnobMajorRadius + RingWidth/2, 0, 1])
					cube([RingWidth*.5, MarkingWidth, 2], center=true);		
	
	if (Pointer2==1)
		translate([KnobRadius, 0, KnobHeight/2-2])
			rotate([0, TaperAngle, 0])
                translate([-9/2, -3/2, -6])
				cube([9, 3, 8], center=false);		

	if (RingWidth>0)
		translate([0, 0, RingThickness/2])
			cylinder(r1=KnobMajorRadius + RingWidth, r2=KnobMinorRadius,
					h=RingThickness, $fn=50, center=true);

	if (Divot==2)
		translate([0, 0, KnobHeight])
			difference()
			{
				scale([1, 1, 0.5])
					sphere(r=KnobMinorRadius, $fn=50, center=true);

				translate([0, 0, 0-(KnobMinorRadius+.001)])
					cube([KnobMinorRadius*2.5, KnobMinorRadius*2.5,
							KnobMinorRadius*2], center=true);
			}

	if (TimerKnob==1) intersection()
		{
			translate([0, 0, 0-(KnobDiameter*TimerKnobConst) + KnobHeight])
			sphere(r=KnobDiameter*TimerKnobConst, $fn=50, center=true);		
	
			translate([0-(KnobDiameter*TimerKnobConst)*0.1, 0,
					KnobHeight/2])
				scale([1, 0.5, 1])
					cylinder(h=KnobHeight, r=(KnobDiameter*TimerKnobConst) *
							0.8, $fn=3, center=true);
		}
}

// Pointer1: Offset hemispherical divot
if (Pointer1==1)
	translate([KnobMinorRadius*.55, 0, KnobHeight + DivotRadius*.6])
		sphere(r=DivotRadius, $fn=40);

// Divot1: Centered cylynrical divot
if (Divot==1)
	translate([0, 0, KnobHeight])
		cylinder(h=DivotDepth*2, r=KnobMinorRadius-1.5, $fn=50,
				center=true);

if (ShaftLength==0)
{
	// Hole for shaft
	translate([0, 0, HoleDepth/2 - 0.001])
		difference()
		{
			cylinder(r=HoleDiameter/2, h=HoleDepth, $fn=50,
					center=true);
	
			// Flat for D-shaped hole
			translate([(0-HoleDiameter)+HoleFlatThickness, 0, 0])
				cube([HoleDiameter, HoleDiameter, HoleDepth+.001],
						center=true);
		}
        // Hole2
        if (Hole2Depth > 0) {
            translate([0, 0, Hole2Depth/2 - 0.001])
                cylinder(r=Hole2Diameter/2, h=Hole2Depth, $fn=20, center=true);
        }
        // Hole3
        if (Hole3Depth > 0) {
            translate([0, 0, Hole3Depth/2 - 0.001])
                cylinder(r=Hole3Diameter/2, h=Hole3Depth, $fn=20, center=true);
        }
	
	// Hole for setscrew
	if (ScrewHoleDiameter>0)
		translate([0 - (KnobMajorRadius+RingWidth+1)/2, 0,
				HoleDepth/2])
			rotate([0, 90, 0])
			cylinder(h=(KnobMajorRadius+RingWidth+1),
					r=ScrewHoleDiameter/2, $fn=20, center=true);
}

// Make sure bottom ends at z=0
translate([0, 0, -10])
	cube([(KnobMajorRadius+RingWidth) * 4,
			(KnobMajorRadius+RingWidth) * 4, 20], center=true);
}

if (ShaftLength>0)
	difference()
	{
		translate([0, 0, ShaftLength/2])
			cylinder(h=ShaftLength, r=ShaftDiameter/2, $fn=20,
					center=true);

		if (NotchedShaft==1)
		{
			cube([HoleDiameter/2, ShaftDiameter*2, ShaftLength],
					center=true);
		}

		// Hole for shaft
		translate([0, 0, HoleDepth/2 - 0.001])
			difference()
			{
				cylinder(r=HoleDiameter/2, h=HoleDepth, $fn=20,
						center=true);
		
				// Flat for D-shaped hole
				translate([(0-HoleDiameter)+HoleFlatThickness, 0, 0])
					cube([HoleDiameter, HoleDiameter, HoleDepth+.001],
							center=true);
			}
		            
        
		// Hole for setscrew
		if (ScrewHoleDiameter>0)
			translate([0 - (KnobMajorRadius+RingWidth+1)/2, 0,
					HoleDepth/2])
				rotate([0, 90, 0])
				cylinder(h=(KnobMajorRadius+RingWidth+1),
						r=ScrewHoleDiameter/2, $fn=20, center=true);
	}
}


