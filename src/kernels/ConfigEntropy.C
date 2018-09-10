//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "ConfigEntropy.h"

registerMooseObject("MooseApp", ConfigEntropy);

template <>
InputParameters
validParams<ConfigEntropy>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");
  params.addParam<Real>(
      "n", 4.1488e4, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");

  return params;
}

ConfigEntropy::ConfigEntropy(const InputParameters & parameters)
  : Kernel(parameters),

    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),
    _n(getParam<Real>("n"))
{
}

Real
ConfigEntropy::computeQpResidual()
{
  return (_R * _T * _n * log(_u[_qp] / (1 - _u[_qp]))) * _test[_i][_qp];
}

//*
Real
ConfigEntropy::computeQpJacobian()
{
  return (_R * _T * _n * (1 / (_u[_qp] * (1 - _u[_qp])))) * _test[_i][_qp] * _phi[_j][_qp];
}
/**/
