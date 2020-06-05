//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "SurfaceNodalRes.h"

registerMooseObject("MooseApp", SurfaceNodalRes);

template <>
InputParameters
validParams<SurfaceNodalRes>()
{
  InputParameters params = validParams<NodalKernel>();

  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("ele", "The variable for coupled electrons.");
  params.addRequiredCoupledVar("vac", "The variable for coupled vacancies.");

  params.addParam<Real>("Ns", 1, "Site density (Ns). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("M", 1, "Mobility");
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");
  params.addParam<Real>("Pco", 1, "CO Partial pressure");
  params.addParam<Real>("Pco2", 1, "CO2 Partial pressure");

  params.addParam<Real>("eta1", 1, "Pre-exponential parameter ads");
  params.addParam<Real>("eta2", 1, "Pre-exponential parameter inc");
  params.addParam<Real>("dHdd1", 1, "Enthalpy** for ads");
  params.addParam<Real>("dHdd2", 1, "Enthalpy** for inc");
  params.addParam<Real>("dS1", 1, "Entropy for ads");
  params.addParam<Real>("dS2", 1, "Entropy for inc");
  params.addParam<Real>("dH1", 1, "Enthalpy for ads");
  params.addParam<Real>("dH2", 1, "Enthalpy for inc");

  return params;
}

SurfaceNodalRes::SurfaceNodalRes(const InputParameters & parameters)
  : NodalKernel(parameters),

    _ele_var(coupledValue("ele")),
    _vac_var(coupledValue("vac")),
    
    _e_var(coupled("ele")),
    _v_var(coupled("vac")),

    _Ns(getParam<Real>("Ns")),
    _M(getParam<Real>("M")),
    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),
    _Pco(getParam<Real>("Pco")),
    _Pco2(getParam<Real>("Pco2")),
 
    _eta1(getParam<Real>("eta1")),
    _eta2(getParam<Real>("eta2")),
    _dHdd1(getParam<Real>("dHdd1")),
    _dHdd2(getParam<Real>("dHdd2")),
    _dS1(getParam<Real>("dS1")),
    _dS2(getParam<Real>("dS2")),
    _dH1(getParam<Real>("dH1")),
    _dH2(getParam<Real>("dH2"))
    
{
}

Real
SurfaceNodalRes::computeQpResidual()
{
  //  return -_rate;
  return 1;

  /*  return (_Ns*_M) * (_R*_T * ( (1/ (1-_u[_qp]) ) * (_grad_u[_qp] * _grad_test[_i][_qp]) + ( (1/ ((1-_u[_qp]) * (1-_u[_qp])) ) * ( _grad_u[_qp] * _grad_u[_qp] * _test[_i][_qp]) ) ) ) + ( _eta1 * exp(-_dHdd1/(_R*_T))) * (_Pco2*(1-_vac_var[_qp]-_u[_qp]) - (_u[_qp]/ (exp(_dS1/_R)*exp(-_dH1/(_R*_T))) )) - (_eta2 * exp(-_dHdd2/(_R*_T))) * (_u[_qp]*_vac_var[_qp]*_ele_var[_qp]*_ele_var[_qp] - (_Pco * (1-_vac_var[_qp]-_u[_qp]) * (1-_vac_var[_qp]) * (1-_ele_var[_qp]) * (1-_ele_var[_qp]) /(exp(_dS2/_R)*exp(-_dH2/(_R*_T))) ) ) * _test[_i][_qp] ;
   */
}

Real
SurfaceNodalRes::computeQpJacobian()
{
  return 0;
}
