// This file is part of the MOOSE framework
// https://www.mooseframework.org
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#include "ADChemPotential.h"

registerMooseObject("MooseApp", ADChemPotential);

InputParameters
ADChemPotential::validParams()
{
  InputParameters params = ADKernel::validParams();

  params.addRequiredCoupledVar("con", "The variable for coupled concentration.");

  params.addParam<Real>(
      "Ns", 1, "Site density (Ns). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>(
      "M",
      1,
      "Mobility");
  
  return params;
}

ADChemPotential::ADChemPotential(const InputParameters & parameters)
  : ADKernel(parameters),

    _con_vector(adCoupledValue("con")),
    _con_grad(adCoupledGradient("con")),
    
    _Ns(getParam<Real>("Ns")),
    _M(getParam<Real>("M"))
{
}

ADReal
ADChemPotential::computeQpResidual()
{
  //  return -_Ns * _M * _con_var[_qp] * _grad_u[_qp] * _grad_test[_i][_qp];
  return _Ns * _M * (-_con_vector[_qp] * _grad_u[_qp] * _grad_test[_i][_qp] + _grad_u[_qp] * _con_grad[_qp] * _test[_i][_qp]);
}

