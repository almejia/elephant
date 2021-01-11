//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ADKernel.h"

class ADSurfacePC : public ADKernel
{
 public:
  static InputParameters validParams();

  ADSurfacePC(const InputParameters & parameters);

 protected:
  virtual ADReal computeQpResidual() override;

 private:  
  const Real _Ns;    /** Site density */
  const Real _M;     /** Mobility */
  const Real _R;     /** Gas constant */
  const Real _T;     /** Temperature */  
};
