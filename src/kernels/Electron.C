//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "Electron.h"

registerMooseObject("MooseApp", Electron);

template <>
InputParameters
validParams<Electron>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("vac", "Coupled variable [vacancy concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");

  params.addRequiredCoupledVar("mu", "Coupled variable mu (chemical potential).");
  
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "ny", 4.1488e4, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nyy",
      1.6595e5,
      "Cation-cation next-nearest-neighbor bond density (nyy). Default is 165952 = 4*ny.");
  params.addParam<Real>(
      "nyv",
      3.3190e5,
      "Anion-cation next-nearest-neighbor bond density (nyv). Default is 331900 = 8*ny.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("fy", 90000.0, "Dopant self interaction energy (fy). Default is 9e4.");
  params.addParam<Real>(
      "fyv", -7000.0, "Dopant-vacancy interaction energy (fyv). Default is -7e3.");
  params.addParam<Real>("cd", 8e-9, "Dopant gradient energy coefficient (cd). Default is 8e-9.");

  params.addParam<Real>("lambd", -1.599515214e9, "Lagrange multiplier"); //-1.603e9

  return params;
}

Electron::Electron(const InputParameters & parameters)
  : Kernel(parameters),

    _vac_var(coupledValue("vac")),
    _phi_var(coupledValue("phi")),

    _mu_var(coupledValue("mu")),

    _v_var(coupled("vac")),
    _p_var(coupled("phi")),

    _m_var(coupled("mu")),

    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Dop(getParam<Real>("Dop")),
    _ny(getParam<Real>("ny")),
    _nyy(getParam<Real>("nyy")),
    _nyv(getParam<Real>("nyv")),
    _F(getParam<Real>("F")),
    _fy(getParam<Real>("fy")),
    _fyv(getParam<Real>("fyv")),
    _cd(getParam<Real>("cd")),

    _lambd(getParam<Real>("lambd"))
{
}

Real
Electron::computeQpResidual()
{
    return _cd * _grad_u[_qp] * _grad_test[_i][_qp] +
         ((-_ny * _F * _phi_var[_qp]) + (_nyv * _fyv * _vac_var[_qp]) +
          2 * _nyy * _fy * _u[_qp] + _R * _T * _ny * log(_u[_qp] / (1 - _u[_qp] - _Dop)) + _lambd - /*_ny**/_mu_var[_qp]) *
	  _test[_i][_qp];
}

Real
Electron::computeQpJacobian()
{ 
  return +_cd * _grad_phi[_j][_qp] * _grad_test[_i][_qp] +
         2 * _nyy * _fy * _test[_i][_qp] * _phi[_j][_qp] +
         _R * _T * _ny * ((1 - _Dop) / (_u[_qp] * (1 - _u[_qp] - _Dop))) * _test[_i][_qp] * _phi[_j][_qp];
}

Real
Electron::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _v_var)
  {
    return _nyv * _fyv * _test[_i][_qp] * _phi[_j][_qp];
  }

  if (jvar == _p_var)
  {
    return -_ny * _F * _test[_i][_qp] * _phi[_j][_qp];
  }
  if (jvar == _m_var)
  {
    return -/**_ny **/ _test[_i][_qp] * _phi[_j][_qp];
  }
  
  return 0.0;
}
