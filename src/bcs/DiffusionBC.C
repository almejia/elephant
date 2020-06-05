//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "DiffusionBC.h"
//#include "func_bssanova_2.hpp"


registerMooseObject("ElephantApp", DiffusionBC);

template <>
InputParameters
validParams<DiffusionBC>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addParam<Real>("gradient_coefficient", 1e-9, "Gradient coefficient term");
  return params;
}

DiffusionBC::DiffusionBC(const InputParameters & parameters)
  : IntegratedBC(parameters), _diffusion_coefficient(getParam<Real>("gradient_coefficient"))
{
}

Real
DiffusionBC::computeQpResidual()
{
  /*boost::numeric::ublas::vector<double> Betas, Betas1;
  boost::numeric::ublas::vector<double> Par;
  func_bssanova DiskFunc;
  double diskDer = 0;
  double diskRes = 0; 
  bool diskOn = false;
  std::string DiskFile = "config/BCconfig_Discrepancy.txt";

  Betas.resize(5);
  Betas[0] = 0.8422e10; // B_y1
  Betas[1] = 2.9252e10; // B_y2
  Betas[2] = -2.0418e9; // B_vy
  Betas[3] = 1.1804e-9; // B_yp
  Betas[4] = 0;         // B_yyp
  
  diskOn = DiskFunc.SplineConfig(DiskFile);
  if (!diskOn) {
    std::cout << "There is an issue with the Discrepancy file configuration" << std::endl;
    return 0;
  }

  Betas1.resize(DiskFunc.betsize());
  Par.resize(2);
  Par[0] = _u[_qp];

  for (int i = 0; i < Betas1.size(); i++) {
    Betas1[i] = Betas[i];
  }

  DiskFunc.SplineEval(Par,Betas1,diskRes);

  return _test[_i][_qp] * 2*(diskRes) * _grad_u[_qp] * _normals[_qp];*/
  
  return _test[_i][_qp] * _diffusion_coefficient * _grad_u[_qp] * _normals[_qp];
}

Real
DiffusionBC::computeQpJacobian()
{
  // Derivative of the residual with respect to "u"
  return _test[_i][_qp] * _diffusion_coefficient * _grad_phi[_j][_qp] * _normals[_qp];
}
