// Gmsh project created on Tue Aug 18 11:35:13 2020
//+
Point(28) = {4.465e-3, 2.0004e-3, 0, 1.0};
Point(29) = {4.465e-3, 2.00038e-3, 0, 1.0};
Point(30) = {4.51e-3, 2.00038e-3, 0, 1.0};
Point(31) = {4.51e-3, 2.0004e-3, 0, 1.0};
//+
Line(39) = {28, 29};
//+
Line(40) = {29, 30};
//+
Line(41) = {30, 31};
//+
Line(42) = {31, 28};
//+
//+
Curve Loop(10) = {39, 40, 41, 42};
//+
Plane Surface(10) = {10};
//+
Transfinite Surface {10} = {28, 29, 30, 31};
//+
Transfinite Curve {39, 41} = 25 Using Progression 1;
//+
Transfinite Curve {40, 42} = 60 Using Progression 1;
//+
Recombine Surface {10};
//+
Physical Curve("top_ref_CeO2") = {42};
//+
//Physical Surface("CeO2") = {10};

