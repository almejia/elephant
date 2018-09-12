//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "DiffusionBC.h"

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
  return _test[_i][_qp] * _diffusion_coefficient * _grad_u[_qp] * _normals[_qp];
}

Real
DiffusionBC::computeQpJacobian()
{
  // Derivative of the residual with respect to "u"
  return _test[_i][_qp] * _diffusion_coefficient * _grad_phi[_j][_qp] * _normals[_qp];
}
