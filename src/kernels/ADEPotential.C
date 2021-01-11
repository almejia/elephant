// This file is part of the MOOSE framework
// https://www.mooseframework.org
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#include "ADEPotential.h"

registerMooseObject("MooseApp", ADEPotential);

InputParameters
ADEPotential::validParams()
{
  InputParameters params = ADKernel::validParams();

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

ADEPotential::ADEPotential(const InputParameters & parameters)
  : ADKernel(parameters),

    _ele_vector(adCoupledValue("ele")),
    _vac_vector(adCoupledValue("vac")),

    _Dop(getParam<Real>("Dop")),
    _ny(getParam<Real>("ny")),
    _F(getParam<Real>("F")),
    _nv(getParam<Real>("nv")),
    _eps0(getParam<Real>("eps0")),
    _epsr(getParam<Real>("epsr"))
{
}

ADReal
ADEPotential::computeQpResidual()
{
  return -(_eps0 * _epsr) * _grad_u[_qp] * _grad_test[_i][_qp] +
         (_F * (2 * _nv * _vac_vector[_qp] - _ny * _Dop - _ny * _ele_vector[_qp])) * _test[_i][_qp];
}
