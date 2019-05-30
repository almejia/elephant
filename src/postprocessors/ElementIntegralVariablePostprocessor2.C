//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "ElementIntegralVariablePostprocessor2.h"

registerMooseObject("MooseApp", ElementIntegralVariablePostprocessor2);

template <>
InputParameters
validParams<ElementIntegralVariablePostprocessor2>()
{
  InputParameters params = validParams<ElementIntegralPostprocessor>();
  params.addRequiredCoupledVar("variable", "The name of the variable that this object operates on");

  params.addParam<Real>("var", 0.1, "Average value");

  return params;
}

ElementIntegralVariablePostprocessor2::ElementIntegralVariablePostprocessor2(
    const InputParameters & parameters)
  : ElementIntegralPostprocessor(parameters),
    MooseVariableInterface<Real>(this,
                                 false,
                                 "variable",
                                 Moose::VarKindType::VAR_ANY,
                                 Moose::VarFieldType::VAR_FIELD_STANDARD),
    _u(coupledValue("variable")),
    _grad_u(coupledGradient("variable")),
    _var(getParam<Real>("var"))

{
  addMooseVariableDependency(mooseVariable());
}

Real
ElementIntegralVariablePostprocessor2::computeQpIntegral()
{
  return _u[_qp] - _var;
}
