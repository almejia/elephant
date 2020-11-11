// This file is part of the MOOSE framework
// https://www.mooseframework.org
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ADKernel.h"

class ADVacancyKin : public ADKernel
{
 public:
  static InputParameters validParams();
  
  ADVacancyKin(const InputParameters & parameters);

 protected:
  virtual ADReal computeQpResidual() override;

 private:
  const ADVariableValue & _ele_vector;
  const ADVariableValue & _phi_vector;
  const ADVariableValue & _muv_vector;
  
  const Real _R; /** Universal constant [J/mol*K] */
  const Real _T; /** Temperature [K] */

  const Real _Dop; /** Dopant fixed concentration */
  const Real _nv;  /** Cation site density [mol/m^3] */
  const Real _nvv; /** Anion-anion density [mol/m^3] */
  const Real _nqv; /** Anion-cation density [mol/m^3] */
  const Real _F;   /** 96485.0 */
  const Real _fv;  /** Dopant self-interaction [J/mol] */
  const Real _fqv; /** Dopant-vacancy interaction [J/mol] */
  const Real _gv;  /** Dopant gradient energy coefficient [J/mol-m] */

  const Real _lambv; /** Lagrange multiplier */
};
