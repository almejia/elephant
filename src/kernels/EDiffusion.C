//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "EDiffusion.h"

registerMooseObject("MooseApp", EDiffusion);

template <>
InputParameters
validParams<EDiffusion>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("dop", "The variable for dopant concentration.");
  params.addRequiredCoupledVar("vac", "The variable for vacancy concentration.");

  params.addParam<Real>("Z", 2, "Dopant chemical formula index");
  params.addParam<Real>(
      "ny", 41488.0, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("nv", 82976.0, "Anion site density (nv). Default is 92976 = 2*ny.");
  params.addParam<Real>("eps0", 8.85e-12, "Physicial parameter. Default is 8.85e-12.");
  params.addParam<Real>("epsr", 35.0, "Material parameter. Default is 35.");

  return params;
}

EDiffusion::EDiffusion(const InputParameters & parameters)
  : Kernel(parameters),

    _dop_var(coupledValue("dop")),
    _vac_var(coupledValue("vac")),

    _d_var(coupled("dop")),
    _v_var(coupled("vac")),

    _Z(getParam<Real>("Z")),
    _ny(getParam<Real>("ny")),
    _F(getParam<Real>("F")),
    _nv(getParam<Real>("nv")),
    _eps0(getParam<Real>("eps0")),
    _epsr(getParam<Real>("epsr"))
{
}

Real
EDiffusion::computeQpResidual()
{
  //  std::cout << "\nqp: " << _qp << "\ti: " << _i << "\nphi: " << _grad_u[_qp] << "\ngradient: "
  //  << _grad_test[_i][_qp] << "\n u: " << _dop_var[_qp] << "\n v: " << _vac_var[_qp] << "\n test:
  //  " << _test[_i][_qp] << "\n"; _x = 0; _x = (_eps0 * _epsr) * _grad_u[_qp] * _grad_test[_i][_qp]
  //  + (_F * ( 2 * _nv * _vac_var[_qp] - _ny * _Z *_dop_var[_qp] ) ) * _test[_i][_qp]; std::cout <<
  //  "\nphi: " << _u[_qp]; //(_eps0 * _epsr) * _grad_u[_qp] * _grad_test[_i][_qp] + (_F * ( 2 * _nv
  //  * _vac_var[_qp] - _ny * _Z *_dop_var[_qp] ) ) * _test[_i][_qp];
  return -(_eps0 * _epsr) * _grad_u[_qp] * _grad_test[_i][_qp] +
         (_F * (2 * _nv * _vac_var[_qp] - _ny * _Z * _dop_var[_qp])) * _test[_i][_qp];
}

Real
EDiffusion::computeQpJacobian()
{
  //  std::cout << "Jacobian: " << _grad_phi[_j][_qp] << " * " << _grad_test[_i][_qp] << "\n";
  return -(_eps0 * _epsr) * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
}

Real
EDiffusion::computeQpOffDiagJacobian(unsigned int jvar)
{
  //  std::cout << jvar << "\n";
  if (jvar == _d_var)
  {
    return -_F * _Z * _ny * _test[_i][_qp] * _phi[_j][_qp];
  }

  else if (jvar == _v_var)
  {
    return _F * 2 * _nv * _test[_i][_qp] * _phi[_j][_qp];
  }

  return 0.0;
}
