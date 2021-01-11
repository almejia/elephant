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

class ADEPotential : public ADKernel
{
 public:
  static InputParameters validParams();
  
  ADEPotential(const InputParameters & parameters);

 protected:
  virtual ADReal computeQpResidual() override;

 private:  
  const ADVariableValue & _ele_vector;
  const ADVariableValue & _vac_vector;

  const Real _Dop;  /** Dopant fixed concentration ZA + O_2 --> 2AO */
  const Real _ny;   /** Cation site density [mol/m^3] /**/
  const Real _F;    /** 96485.0 */
  const Real _nv;   /** Anion site density [mol/m^3] /**/
  const Real _eps0; /** Physical parameters /**/
  const Real _epsr; /** Material parameters /**/
};

