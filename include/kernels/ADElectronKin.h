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

class ADElectronKin : public ADKernel
{
 public:
  static InputParameters validParams();
  
  ADElectronKin(const InputParameters & parameters);

 protected:
  virtual ADReal computeQpResidual() override;

 private:
  const ADVariableValue & _vac_vector;
  const ADVariableValue & _phi_vector;
  const ADVariableValue & _muq_vector;
  
  const Real _R; /** Universal constant [J/mol*K] */
  const Real _T; /** Temperature [K] */

  const Real _Dop; /** Dopant fixed concentration */
  const Real _nq;  /** Cation site density [mol/m^3] */
  const Real _nqq; /** Cation-cation density [mol/m^3] */
  const Real _nqv; /** Anion-cation density [mol/m^3] */
  const Real _F;   /** 96485.0 */
  const Real _fq; /** Electron self-interaction [J/mol] */
  const Real _fqv; /** Electron-vacancy interaction [J/mol] */
  const Real _gq;  /** Electron gradient energy coefficient [J/mol-m] */

  const Real _lambd; /** Lagrange multiplier */
};
