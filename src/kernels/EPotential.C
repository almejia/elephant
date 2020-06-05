//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "EPotential.h"

registerMooseObject("MooseApp", EPotential);

template <>
InputParameters
validParams<EPotential>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("ele", "The variable for dopant concentration.");
  params.addRequiredCoupledVar("vac", "The variable for vacancy concentration.");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "ny", 41488.0, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("nv", 82976.0, "Anion site density (nv). Default is 92976 = 2*ny.");
  params.addParam<Real>("eps0", 8.85e-12, "Physicial parameter. Default is 8.85e-12.");
  params.addParam<Real>("epsr", 35.0, "Material parameter. Default is 35.");

  return params;
}

EPotential::EPotential(const InputParameters & parameters)
  : Kernel(parameters),

    _ele_var(coupledValue("ele")),
    _vac_var(coupledValue("vac")),

    _e_var(coupled("ele")),
    _v_var(coupled("vac")),

    _Dop(getParam<Real>("Dop")),
    _ny(getParam<Real>("ny")),
    _F(getParam<Real>("F")),
    _nv(getParam<Real>("nv")),
    _eps0(getParam<Real>("eps0")),
    _epsr(getParam<Real>("epsr"))
{
}

Real
EPotential::computeQpResidual()
{
  return -(_eps0 * _epsr) * _grad_u[_qp] * _grad_test[_i][_qp] +
         (_F * (2 * _nv * _vac_var[_qp] - _ny * _Dop - _ny * _ele_var[_qp])) * _test[_i][_qp];
}

Real
EPotential::computeQpJacobian()
{
  return -(_eps0 * _epsr) * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
}

Real
EPotential::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _e_var)
  {
    return -_F * _ny * _test[_i][_qp] * _phi[_j][_qp];
  }

  else if (jvar == _v_var)
  {
    return _F * 2 * _nv * _test[_i][_qp] * _phi[_j][_qp];
  }

  return 0.0;
}
