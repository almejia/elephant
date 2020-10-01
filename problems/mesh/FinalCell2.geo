// Gmsh project created on Tue Aug 18 11:35:13 2020
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0, 2e-3, 0, 1.0};
//+
Point(3) = {1.5e-3, 2e-3, 0, 1.0};
//+
Point(4) = {3.5e-3, 2e-3, 0, 1.0};
//+
Point(5) = {3.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(6) = {3.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(7) = {4.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(8) = {6.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(9) = {6.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(10) = {4.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(11) = {4.5e-3, 2e-3, 0, 1.0};
//+
Point(12) = {6.5e-3, 2e-3, 0, 1.0};
//+
Point(13) = {6.5e-3, 0, 0, 1.0};
//+
Point(14) = {4.5e-3, 0, 0, 1.0};
//+
Point(15) = {3.5e-3, 0, 0, 1.0};
//+
Point(16) = {1.5e-3, 0, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 7};
//+
Line(7) = {7, 8};
//+
Line(8) = {8, 9};
//+
Line(9) = {9, 10};
//+
Line(10) = {10, 11};
//+
Line(11) = {11, 12};
//+
Line(12) = {12, 13};
//+
Line(13) = {13, 14};
//+
Line(14) = {14, 15};
//+
Line(15) = {15,16};
//+
Line(16) = {16,1};
//+
Line(17) = {5, 10};
//+
Line(18) = {4, 11};
//+
Curve Loop(1) = {1, 2, 3, 18, 11, 12, 13, 14, 15,16};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {4,17,10,-18};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {5, 6, 7, 8, 9, -17};
//+
Plane Surface(3) = {3};
//+
Transfinite Surface {1} = {1, 2, 12, 13};
//+
Transfinite Surface {3} = {5, 6, 8, 9};
//+
Transfinite Surface {2} = {4, 5, 10, 11};
//+
Transfinite Curve {1, 12} = 15 Using Progression 1;
//+
Transfinite Curve {4, 10} = 30 Using Progression 1;
//+
Transfinite Curve {5} = 80 Using Progression 0.8;
Transfinite Curve {8} = 80 Using Progression 1.25;
//+
Transfinite Curve {6, 14, 17, 18} = 5000 Using Progression 1;
//+
Transfinite Curve {7, 9} = 10000 Using Progression 1;
Transfinite Curve {11, 13} = 12 Using Progression 1;
//+
Transfinite Curve {2,16} = 9 Using Progression 1;
Transfinite Curve {3,15} = 12 Using Progression 1;
//+
Recombine Surface {3};
//+
Recombine Surface {1};
//+
Recombine Surface {2};
//+
Physical Curve("left_YSZ") = {1};
//+
Physical Curve("Pt") = {2};
//+
Physical Curve("top_mid_YSZ") = {3};
//+
Physical Curve("left_CeO2") = {4, 5};
//+
Physical Curve("top_CeO2") = {6, 7};
//+
Physical Curve("right_CeO2") = {8};
//+
Physical Curve("CeO2_Au") = {9, 10};
//+
Physical Curve("YSZ_Au") = {11};
//+
Physical Curve("right_YSZ") = {12};
//+
Physical Curve("bottom_YSZ") = {13, 14, 15, 16};
//+
Physical Curve("CeO2_YSZ") = {18};
//+
Physical Surface("YSZ") = {1};
//+
Physical Surface("CeO2") = {2, 3};
