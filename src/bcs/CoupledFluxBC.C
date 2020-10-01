//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CoupledFluxBC.h"

registerMooseObject("MooseApp", CoupledFluxBC);

template <>
InputParameters
validParams<CoupledFluxBC>()
{
  InputParameters params = validParams<IntegratedBC>();

  // Specify input parameters that we want users to be able to set:
  params.addParam<Real>("alpha", 1.0, "Value multiplied by the coupled value on the boundary");
  params.addRequiredCoupledVar("the", "The variable for coupled adsorbates (theta).");
  params.addRequiredCoupledVar("ele", "The variable for coupled electrons.");
  params.addRequiredCoupledVar("vac", "The variable for coupled vacancies.");

  params.addParam<Real>("Ns", 1, "Site density (Ns). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("M", 1, "Mobility");
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");
  params.addParam<Real>("Pco", 1, "CO Partial pressure");
  params.addParam<Real>("Pco2", 1, "CO2 Partial pressure");

  params.addParam<Real>("eta2", 1, "Pre-exponential parameter inc");
  params.addParam<Real>("dHdd2", 1, "Enthalpy** for inc");
  params.addParam<Real>("dS2", 1, "Entropy for inc");
  params.addParam<Real>("dH2", 1, "Enthalpy for inc");

  return params;
}

CoupledFluxBC::CoupledFluxBC(const InputParameters & parameters)
  : IntegratedBC(parameters),
    // store the user-specified parameters from the input file...
    _alpha(getParam<Real>("alpha")),        // for the multiplier
    _the_var(coupledValue("the")),
    _ele_var(coupledValue("ele")),
    _vac_var(coupledValue("vac")),
    
    _t_var(coupled("the")),
    _e_var(coupled("ele")),
    _v_var(coupled("vac")),

    _Ns(getParam<Real>("Ns")),
    _M(getParam<Real>("M")),
    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),
    _Pco(getParam<Real>("Pco")),
    _Pco2(getParam<Real>("Pco2")),
 
    _eta2(getParam<Real>("eta2")),
    _dHdd2(getParam<Real>("dHdd2")),
    _dS2(getParam<Real>("dS2")),
    _dH2(getParam<Real>("dH2"))

{
}

Real
CoupledFluxBC::computeQpResidual()
{
  // For this Neumann BC grad(u)=alpha * v on the boundary.
  // We use the term produced from integrating the diffusion operator by parts.
  return _test[_i][_qp] * _alpha * (_eta2 * exp(-_dHdd2/(_R*_T))) * (_the_var[_qp]*_vac_var[_qp]*_ele_var[_qp]*_ele_var[_qp] - (_Pco * (1-_vac_var[_qp]-_the_var[_qp]) * (1-_vac_var[_qp]-_the_var[_qp]) * (1-_ele_var[_qp]) * (1-_ele_var[_qp]) /(exp(_dS2/_R)*exp(-_dH2/(_R*_T))) ) );
}
