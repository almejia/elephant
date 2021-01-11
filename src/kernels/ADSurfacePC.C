// This file is part of the MOOSE framework
// https://www.mooseframework.org
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#include "ADSurfacePC.h"

registerMooseObject("MooseApp", ADSurfacePC);

InputParameters
ADSurfacePC::validParams()
{
  InputParameters params = ADKernel::validParams();
 
  params.addParam<Real>("Ns", 1, "Site density (Ns). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("Mob", 1, "Mobility");
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (K).");

  return params;
}

ADSurfacePC::ADSurfacePC(const InputParameters & parameters)
  : ADKernel(parameters),

    _Ns(getParam<Real>("Ns")),
    _M(getParam<Real>("Mob")),
    _R(getParam<Real>("R")),
    _T(getParam<Real>("T"))
{
}

ADReal
ADSurfacePC::computeQpResidual()
{  
  return (_Ns*_M) * (_R*_T * ( (1/ (1-_u[_qp]) ) * (-_grad_u[_qp] * _grad_test[_i][_qp]) + ( (1/ ((1-_u[_qp]) * (1-_u[_qp])) ) * ( _grad_u[_qp] * _grad_u[_qp] * _test[_i][_qp]) ) ) );
}
