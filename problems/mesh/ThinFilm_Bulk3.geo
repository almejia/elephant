// Gmsh project created on Tue Aug 18 11:35:13 2020
//+
Point(11) = {3.5e-3, 2e-3, 0, 1.0};
Point(12) = {3.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(13) = {3.5e-3, 2.00038e-3, 0, 1.0};
Point(14) = {3.5e-3, 2.0004e-3, 0, 1.0};
//+
Point(15) = {4.465e-3, 2.0004e-3, 0, 1.0};
Point(16) = {4.465e-3, 2.00038e-3, 0, 1.0};
Point(17) = {4.51e-3, 2.00038e-3, 0, 1.0};
Point(18) = {4.51e-3, 2.0004e-3, 0, 1.0};
//+
Point(19) = {6.5e-3, 2.0004e-3, 0, 1.0};
Point(20) = {6.5e-3, 2.00038e-3, 0, 1.0};
//+
Point(21) = {6.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(22) = {4.5e-3, 2.0002e-3, 0, 1.0};
//+
Point(23) = {4.5e-3, 2e-3, 0, 1.0};
Point(24) = {4.465e-3, 2e-3, 0, 1.0};
Point(25) = {4.5e-3, 2.00038e-3, 0, 1.0};
Point(26) = {4.51e-3, 2.0002e-3, 0, 1.0};
Point(27) = {4.465e-3, 2.0002e-3, 0, 1.0};
//+
Line(11) = {11, 12};
//+
Line(12) = {12, 13};
//+
Line(13) = {13, 14};
//+
Line(14) = {14, 15};
//+
Line(15) = {15, 16};
//+
//Line(16) = {16, 17};
//+
Line(17) = {17, 18};
//+
Line(18) = {18, 19};
//+
Line(19) = {19, 20};
Line(20) = {20, 21};
//Line(21) = {21, 22};
Line(22) = {22, 23};
//Line(23) = {23,11};
//+
Line(24) = {12, 27};
Line(25) = {13, 16};
Line(26) = {17, 20};
Line(27) = {27, 24};
Line(28) = {25, 22};
Line(29) = {17, 26};
Line(30) = {24, 11};
Line(31) = {16, 27};
Line(32) = {27, 22};
Line(33) = {23, 24};
Line(34) = {16, 25};
Line(35) = {25, 17};
Line(36) = {26, 22};
Line(37) = {21,26};
//Line(38) = {14, 19};
//+
Curve Loop(2) = {11,24,27,30};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {12,25,31,-24};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {13,14,15,-25};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {33,-27,32,22};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {-32,-31,34,28};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {36,-28,35,29};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {37,-29,26,20};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {17,18,19,-26};
//+
Plane Surface(9) = {9};
//+
Transfinite Surface {2} = {11, 12, 27, 24};
Transfinite Surface {3} = {12,13,16,27};
Transfinite Surface {4} = {13,14,15,16};
Transfinite Surface {5} = {24,27,22,23};
Transfinite Surface {6} = {27,16,25,22};
Transfinite Surface {7} = {22,25,17,26};
Transfinite Surface {8} = {26,17,20,21};
Transfinite Surface {9} = {17,18,19,20};
//+
Transfinite Curve {11,27,22} = 10 Using Progression 1;
//+
Transfinite Curve {12,31,28,29,20} = 8 Using Progression 1;
//+
Transfinite Curve {13, 15, 17, 19} = 5 Using Progression 1;
//+
Transfinite Curve {14, 25, 24, 30} = 25 Using Progression 1;
Transfinite Curve {32, 33, 34} = 10 Using Progression 1;
Transfinite Curve {35, 36} = 5 Using Progression 1;
Transfinite Curve {18, 26, 37} = 40 Using Progression 1;
//+
Recombine Surface {2};
Recombine Surface {3};
Recombine Surface {4};
Recombine Surface {5};
Recombine Surface {6};
Recombine Surface {7};
Recombine Surface {8};
Recombine Surface {9};
//+
//+
Physical Curve("left_CeO2") = {11,12,13};
//+
Physical Curve("top_noref_CeO2") = {14,18};
//+
Physical Curve("right_CeO2") = {19,20};
//+
Physical Curve("CeO2_Au") = {37,36,22};
//+
//Physical Curve("CeO2_YSZ") = {33,30};
//+
Physical Surface("CeO2") = {2,3,4,5,6,7,8,9,10};

