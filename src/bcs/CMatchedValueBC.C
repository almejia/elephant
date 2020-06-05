//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CMatchedValueBC.h"

registerMooseObject("MooseApp", CMatchedValueBC);

template <>
InputParameters
validParams<CMatchedValueBC>()
{
  InputParameters params = validParams<NodalBC>();
  params.addRequiredCoupledVar("v", "The variable whose value we are to match.");
  params.addClassDescription("Implements a NodalBC which equates two different Variables' values "
                             "on a specified boundary.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("MuYSZ0", 8.4, "Standard YSZ potential (Mu YSZ). Default is 8.4.");
  
  return params;
}

CMatchedValueBC::CMatchedValueBC(const InputParameters & parameters)
  : NodalBC(parameters), _v(coupledValue("v")), _v_num(coupled("v")), _F(getParam<Real>("F")), _ysz_0(getParam<Real>("MuYSZ0"))

{
}

Real
CMatchedValueBC::computeQpResidual()
{
  return _v[_qp] - 2 * _F * _u[_qp] - _F * _ysz_0;
}

Real
CMatchedValueBC::computeQpJacobian()
{
  return - 2 * _F ;
}

Real
CMatchedValueBC::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _v_num)
    return 1;
  else
    return 0.;
}
