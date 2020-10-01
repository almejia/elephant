// Gmsh project created on Tue Aug 18 11:35:13 2020
//+
Point(1) = {3.5e-3, 2e-3, 0, 1.0};
//+
Point(2) = {3.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(3) = {3.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(4) = {4.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(5) = {6.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(6) = {6.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(7) = {4.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(8) = {4.5e-3, 2e-3, 0, 1.0};
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
Line(8) = {8, 1};
//+
Line(9) = {2, 7};
//+
Curve Loop(1) = {1, 9, 7, 8};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {2, 3, 4, 5, 6, -9};
//+
Plane Surface(2) = {2};
//+
Transfinite Surface {1} = {1, 2, 7, 8};
//+
Transfinite Surface {2} = {2, 3, 5, 6};
//+
Transfinite Curve {1, 7} = 30 Using Progression 1;
//+
Transfinite Curve {2} = 80 Using Progression 0.8;
Transfinite Curve {5} = 80 Using Progression 1.25;
//+
Transfinite Curve {3, 8, 9} = 5000 Using Progression 1;
//+
Transfinite Curve {4, 6} = 10000 Using Progression 1;
//+
Recombine Surface {1};
//+
Recombine Surface {2};
//+
//+
Physical Curve("left_CeO2") = {1,2};
//+
Physical Curve("top_CeO2") = {3, 4};
//+
Physical Curve("right_CeO2") = {5};
//+
Physical Curve("CeO2_Au") = {6, 7};
//+
Physical Curve("CeO2_YSZ") = {8};
//+
Physical Surface("CeO2") = {1,2};
