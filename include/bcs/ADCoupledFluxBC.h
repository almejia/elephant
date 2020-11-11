// This file is part of the MOOSE framework
// https://www.mooseframework.org
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ADIntegratedBC.h"

class ADCoupledFluxBC : public ADIntegratedBC

{
public:
  static InputParameters validParams();
  
  ADCoupledFluxBC(const InputParameters & parameters);

protected:
  virtual ADReal computeQpResidual() override;
  
  /// Multiplier on the boundary.
  const Real _alpha;
  /// reference to a user-specifiable coupled (independent) variable
  const VariableValue & _the_var;
  const VariableValue & _ele_var;
  const VariableValue & _vac_var;

  const Real _Ns;    /** Site density */
  const Real _M;     /** Mobility */
  const Real _R;     /** Gas constant */
  const Real _T;     /** Temperature */
  const Real _Pco;   /** CO partial pressure */
  const Real _Pco2;  /** CO2 partial pressure */

  const Real _eta2;  /** Pre-exponential factor */
  const Real _dHdd2; /** dH**2 */
  const Real _dS2;   /** Entropy2 */
  const Real _dH2;   /** Enthalpy2 */

};

