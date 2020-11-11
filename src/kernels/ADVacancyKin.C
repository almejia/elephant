// This file is part of the MOOSE framework
// https://www.mooseframework.org
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#include "ADVacancyKin.h"

registerMooseObject("MooseApp", ADVacancyKin);

InputParameters
ADVacancyKin::validParams()
{
  InputParameters params = ADKernel::validParams();  
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
      "nqv",
      3.3190e5,
      "Anion-cation next-nearest-neighbor bond density (nyv). Default is 331900 = 8*ny.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("fvv", 9e4, "Dopant self interaction energy (fy). Default is 9e4.");
  params.addParam<Real>("fqv", -7e3, "Dopant-vacancy interaction energy (fyv). Default is -7e3.");
  params.addParam<Real>("gv", 1e-9, "Dopant gradient energy coefficient (cd). Default is 8e-9.");

  params.addParam<Real>("lambv", 1.3934712e9, "Lagrange multiplier"); // 1.3903e9
  params.addRequiredCoupledVar("ele", "Coupled variable [dopant concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");
  params.addRequiredCoupledVar("muv", "Coupled variable muv (electrochemical potential).");

  return params;
}

ADVacancyKin::ADVacancyKin(const InputParameters & parameters)
  : ADKernel(parameters),

    _ele_vector(adCoupledValue("ele")),
    _phi_vector(adCoupledValue("phi")),
    _muv_vector(adCoupledValue("muv")),
    
    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Dop(getParam<Real>("Dop")),
    _nv(getParam<Real>("nv")),
    _nvv(getParam<Real>("nvv")),
    _nqv(getParam<Real>("nqv")),
    _F(getParam<Real>("F")),
    _fv(getParam<Real>("fvv")),
    _fqv(getParam<Real>("fqv")),
    _gv(getParam<Real>("gv")),

    _lambv(getParam<Real>("lambv"))
{
}

ADReal
ADVacancyKin::computeQpResidual()
{
  return _gv * _grad_u[_qp] * _grad_test[_i][_qp] +
         ((_nv * 2 * _F * _phi_vector[_qp]) + (_nqv * _fqv * _ele_vector[_qp]) +
          2 * _nvv * _fv * _u[_qp] + _R * _T * _nv * log(_u[_qp] / (1 - _u[_qp])) + _lambv - _muv_vector[_qp]) *
             _test[_i][_qp];
}
