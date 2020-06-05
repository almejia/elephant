//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "NewVacancy.h"

registerMooseObject("MooseApp", NewVacancy);

template <>
InputParameters
validParams<NewVacancy>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("ele", "Coupled variable [dopant concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");

  params.addRequiredCoupledVar("mu", "Coupled mu variable(chemical potential).");
  
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "nv", 8.2975e4, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("nvv",
                        2.4893e5,
                        "Anion-anion next nearest-neighbor bond density (nvv). Default is 165952 = "
                        "4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nyv",
      3.3190e5,
      "Anion-cation next-nearest-neighbor bond density (nyv). Default is 331900 = 8*ny.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("fv", 9e4, "Dopant self interaction energy (fy). Default is 9e4.");
  params.addParam<Real>("fyv", -7e3, "Dopant-vacancy interaction energy (fyv). Default is -7e3.");
  params.addParam<Real>("cv", 1e-9, "Dopant gradient energy coefficient (cd). Default is 8e-9.");

  params.addParam<Real>("lambv", 1.3934712e9, "Lagrange multiplier"); // 1.3903e9

  return params;
}

NewVacancy::NewVacancy(const InputParameters & parameters)
  : Kernel(parameters),

    _ele_var(coupledValue("ele")),
    _phi_var(coupledValue("phi")),

    _mu_var(coupledValue("mu")),
    
    _e_var(coupled("ele")),
    _p_var(coupled("phi")),

    _m_var(coupled("mu")),


    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Dop(getParam<Real>("Dop")),
    _nv(getParam<Real>("nv")),
    _nvv(getParam<Real>("nvv")),
    _nyv(getParam<Real>("nyv")),
    _F(getParam<Real>("F")),
    _fv(getParam<Real>("fv")),
    _fyv(getParam<Real>("fyv")),
    _cv(getParam<Real>("cv")),

    _lambv(getParam<Real>("lambv"))
{
}

Real
NewVacancy::computeQpResidual()
{
  return _cv * _grad_u[_qp] * _grad_test[_i][_qp] +
         ((_nv * 2 * _F * _phi_var[_qp]) + (_nyv * _fyv * _ele_var[_qp]) +
          2 * _nvv * _fv * _u[_qp] + _R * _T * _nv * log(_u[_qp] / (1 - _u[_qp])) + _lambv - /*_nv **/ _mu_var[_qp]) *
             _test[_i][_qp];
}

Real
NewVacancy::computeQpJacobian()
{
  return +_cv * _grad_phi[_j][_qp] * _grad_test[_i][_qp] +
         2 * _nvv * _fv * _phi[_j][_qp] * _test[_i][_qp] +
         _R * _T * _nv * (1 / (_u[_qp] * (1 - _u[_qp]))) * _test[_i][_qp] * _phi[_j][_qp];
}

Real
NewVacancy::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _e_var)
  {
    return _nyv * _fyv * _test[_i][_qp] * _phi[_j][_qp];
  }

  if (jvar == _p_var)
  {
    return _nv * 2 * _F * _test[_i][_qp] * _phi[_j][_qp];
  }
  if (jvar == _m_var)
  {
    return -/*_nv **/ _test[_i][_qp] * _phi[_j][_qp];
  }
  
  return 0.0;
}
