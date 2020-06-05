//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "IntegratedBC.h"

class CoupledFluxBC;

template <>
InputParameters validParams<CoupledFluxBC>();

/**
 * Implements a simple constant Neumann BC where grad(u)=alpha * v on the boundary.
 * Uses the term produced from integrating the diffusion operator by parts.
 */
class CoupledFluxBC : public IntegratedBC
{
public:
  CoupledFluxBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  
private:
  /// Multiplier on the boundary.
  Real _alpha;
  /// reference to a user-specifiable coupled (independent) variable
  const VariableValue & _the_var;
  const VariableValue & _ele_var;
  const VariableValue & _vac_var;

  unsigned int _t_var;
  unsigned int _e_var;
  unsigned int _v_var;

  Real _Ns;    /** Site density */
  Real _M;     /** Mobility */
  Real _R;     /** Gas constant */
  Real _T;     /** Temperature */
  Real _Pco;   /** CO partial pressure */
  Real _Pco2;  /** CO2 partial pressure */

  Real _eta2;  /** Pre-exponential factor */
  Real _dHdd2; /** dH**2 */
  Real _dS2;   /** Entropy2 */
  Real _dH2;   /** Enthalpy2 */

};

