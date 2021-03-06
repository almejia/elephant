//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "ElectronKin.h"

registerMooseObject("MooseApp", ElectronKin);

template <>
InputParameters
validParams<ElectronKin>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("vac", "Coupled variable [vacancy concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");
  params.addRequiredCoupledVar("muq", "Coupled variable mu (chemical potential).");
  
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "nq", 4.1488e4, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nqq",
      1.6595e5,
      "Cation-cation next-nearest-neighbor bond density (nyy). Default is 165952 = 4*ny.");
  params.addParam<Real>(
      "nqv",
      3.3190e5,
      "Anion-cation next-nearest-neighbor bond density (nyv). Default is 331900 = 8*ny.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("fq", 90000.0, "Dopant self interaction energy (fy). Default is 9e4.");
  params.addParam<Real>(
      "fqv", -7000.0, "Dopant-vacancy interaction energy (fyv). Default is -7e3.");
  params.addParam<Real>("gq", 8e-9, "Dopant gradient energy coefficient (cd). Default is 8e-9.");

  params.addParam<Real>("lambd", -1.599515214e9, "Lagrange multiplier"); //-1.603e9

  return params;
}

ElectronKin::ElectronKin(const InputParameters & parameters)
  : Kernel(parameters),

    _vac_var(coupledValue("vac")),
    _phi_var(coupledValue("phi")),
    _mu_var(coupledValue("muq")),

    _v_var(coupled("vac")),
    _p_var(coupled("phi")),
    _m_var(coupled("muq")),

    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Dop(getParam<Real>("Dop")),
    _nq(getParam<Real>("nq")),
    _nqq(getParam<Real>("nqq")),
    _nqv(getParam<Real>("nqv")),
    _F(getParam<Real>("F")),
    _fq(getParam<Real>("fq")),
    _fqv(getParam<Real>("fqv")),
    _gq(getParam<Real>("gq")),

    _lambd(getParam<Real>("lambd"))
{
}

Real
ElectronKin::computeQpResidual()
{
    return _gq * _grad_u[_qp] * _grad_test[_i][_qp] +
         ((-_nq * _F * _phi_var[_qp]) + (_nqv * _fqv * _vac_var[_qp]) +
          2 * _nqq * _fq * _u[_qp] + _R * _T * _nq * log(_u[_qp] / (1 - _u[_qp] - _Dop)) - _lambd * _mu_var[_qp]) *
	  _test[_i][_qp];
}

Real
ElectronKin::computeQpJacobian()
{ 
  return +_gq * _grad_phi[_j][_qp] * _grad_test[_i][_qp] +
         2 * _nqq * _fq * _test[_i][_qp] * _phi[_j][_qp] +
         _R * _T * _nq * ((1 - _Dop) / (_u[_qp] * (1 - _u[_qp] - _Dop))) * _test[_i][_qp] * _phi[_j][_qp];
}

Real
ElectronKin::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _v_var)
  {
    return _nqv * _fqv * _test[_i][_qp] * _phi[_j][_qp];
  }

  if (jvar == _p_var)
  {
    return -_nq * _F * _test[_i][_qp] * _phi[_j][_qp];
  }
  if (jvar == _m_var)
  {
    return -_lambd * _test[_i][_qp] * _phi[_j][_qp];
  }
  
  return 0.0;
}
