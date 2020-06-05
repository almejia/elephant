//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CDirichletBC.h"

registerMooseObject("MooseApp", CDirichletBC);

template <>
InputParameters
validParams<CDirichletBC>()
{
  InputParameters p = validParams<NodalBC>();
  p.addRequiredParam<Real>("var1", "Value of parameter 1 on BC");
  p.addRequiredParam<Real>("var2", "Value of parameter 2 on BC");
  p.declareControllable("var1");
  p.declareControllable("var2");
  p.addClassDescription("Imposes the custom boundary condition $u=g*f$, where $g$ and $f$ "
                        "are constant, controllable values.");
  return p;
}

CDirichletBC::CDirichletBC(const InputParameters & parameters)
  : NodalBC(parameters), _var1(getParam<Real>("var1")), _var2(getParam<Real>("var2"))
{
}

Real
CDirichletBC::computeQpResidual()
{
  return _u[_qp] - _var1 * _var2;
}
