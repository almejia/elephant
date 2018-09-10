//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef EDIFFUSION_H
#define EDIFFUSION_H

#include "Kernel.h"

class EDiffusion;

template <>
InputParameters validParams<EDiffusion>();

class EDiffusion : public Kernel
{
public:
  EDiffusion(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _dop_var;
  const VariableValue & _vac_var;

  unsigned int _d_var;
  unsigned int _v_var;

  Real _Z;    /** Dopant chemcial formula index ZA + O_2 --> 2AO */
  Real _ny;   /** Cation site density [mol/m^3] /**/
  Real _F;    /** 96485.0 */
  Real _nv;   /** Anion site density [mol/m^3] /**/
  Real _eps0; /** Physical parameters /**/
  Real _epsr; /** Material parameters /**/
};

#endif /* EDIFFUSION_H */
