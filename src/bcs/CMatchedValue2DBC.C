//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CMatchedValue2DBC.h"

registerMooseObject("MooseApp", CMatchedValue2DBC);

template <>
InputParameters
validParams<CMatchedValue2DBC>()
{
  InputParameters params = validParams<NodalBC>();
  params.addRequiredCoupledVar("v", "The variable whose value we are to match.");
  params.addClassDescription("Implements a NodalBC which equates two different Variables' values "
                             "on a specified boundary.");
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");
  params.addParam<Real>("nv", 8.2975e4, "Oxygen vacancies site density (nv).");
  params.addParam<Real>("xv", 0.16, "YSZ standard 8% oxygen vacany site fraction (xv).");  
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("MuYSZ0", 8.4, "Standard YSZ potential (Mu YSZ). Default is 8.4.");
  
  return params;
}

CMatchedValue2DBC::CMatchedValue2DBC(const InputParameters & parameters)
  : NodalBC(parameters), _v(coupledValue("v")), _v_num(coupled("v")), _R(getParam<Real>("R")), _T(getParam<Real>("T")), _nv(getParam<Real>("nv")), _xv(getParam<Real>("xv")), _F(getParam<Real>("F")), _ysz_0(getParam<Real>("MuYSZ0"))

{
}

Real
CMatchedValue2DBC::computeQpResidual()
{
  return _u[_qp] - 2 * _F * _v[_qp] - _F * _ysz_0 - _nv * _R * _T * log(_xv/(1-_xv));
}

Real
CMatchedValue2DBC::computeQpJacobian()
{
  return 1 ;
}

Real
CMatchedValue2DBC::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _v_num)
    return -2 * _F;
  else
    return 0.;
}
