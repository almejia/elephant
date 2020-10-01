//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "ChemPotential2D.h"

registerMooseObject("MooseApp", ChemPotential2D);

template <>
InputParameters
validParams<ChemPotential2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("con", "The variable for coupled concentration.");

  params.addParam<Real>(
      "Ns", 1, "Site density (Ns). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>(
      "M",
      1,
      "Mobility");
  
  return params;
}

ChemPotential2D::ChemPotential2D(const InputParameters & parameters)
  : Kernel(parameters),

    _con_var(coupledValue("con")),

    _c_var(coupled("con")),

    _Ns(getParam<Real>("Ns")),
    _M(getParam<Real>("M"))

{
}

Real
ChemPotential2D::computeQpResidual()
{
  return -_Ns * _M * _con_var[_qp] * _grad_u[_qp] * _grad_test[_i][_qp];
  //  return _Ns * _M * (-_con_var[_qp] * _grad_u[_qp] * _grad_test[_i][_qp] + _grad_u[_qp] * _grad_u[_qp] * _test[_i][_qp]);
}

Real
ChemPotential2D::computeQpJacobian()
{
  return -_Ns * _M * _con_var[_qp] * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
  //  return _Ns * _M * (-_con_var[_qp] * _grad_phi[_j][_qp] * _grad_test[_i][_qp] + _grad_phi[_j][_qp] * _grad_u[_qp] * _test[_i][_qp]);
}

Real
ChemPotential2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _c_var)
  {
    return -_Ns * _M * _phi[_j][_qp] * _grad_u[_qp] * _grad_test[_i][_qp];
  }

  return 0.0;
}

