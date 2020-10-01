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
Point(5) = {4.5e-3, 2e-3, 0, 1.0};
//+
Point(6) = {6.5e-3, 2e-3, 0, 1.0};
//+
Point(7) = {6.5e-3, 0, 0, 1.0};
//+
Point(8) = {4.5e-3, 0, 0, 1.0};
//+
Point(9) = {3.5e-3, 0, 0, 1.0};
//+
Point(10) = {1.5e-3, 0, 0, 1.0};
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
Line(10) = {10, 1};
//+
Curve Loop(1) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
//+
Plane Surface(1) = {1};
//+
Transfinite Surface {1} = {1, 2, 6, 7};
//+
Transfinite Curve {1,6} = 10 Using Progression 1;
//+
Transfinite Curve {2,10} = 7 Using Progression 1;
//+
Transfinite Curve {3,9} = 9 Using Progression 1;
//+
Transfinite Curve {4,8} = 5 Using Progression 1;
//+
Transfinite Curve {5,7} = 9 Using Progression 1;
//+
Recombine Surface {1};
//+
Physical Curve("left_YSZ") = {1};
//+
Physical Curve("Pt") = {2};
//+
Physical Curve("top_mid_YSZ") = {3};
//+
Physical Curve("CeO2_YSZ") = {4};
//+
Physical Curve("YSZ_Au") = {5};
//+
Physical Curve("right_YSZ") = {6};
//+
Physical Curve("bottom_YSZ") = {7,8,9,10};
//+
Physical Surface("YSZ") = {1};
Merge "ThinFilm_Bulk.geo";
Merge "ThinFilm_Surface_Refine.geo";