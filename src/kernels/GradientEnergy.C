//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "GradientEnergy.h"

registerMooseObject("MooseApp", GradientEnergy);

template <>
InputParameters
validParams<GradientEnergy>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addParam<Real>("cg", 8e-9, "Dopant gradient energy coefficient (cd). Default is 8e-9.");

  return params;
}

GradientEnergy::GradientEnergy(const InputParameters & parameters)
  : Kernel(parameters),

    _cg(getParam<Real>("cg"))
{
}

Real
GradientEnergy::computeQpResidual()
{
  return -2 * _cg * _grad_u[_qp] * _grad_test[_i][_qp];
}

//*
Real
GradientEnergy::computeQpJacobian()
{
  return -2 * _cg * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
}
/**/
