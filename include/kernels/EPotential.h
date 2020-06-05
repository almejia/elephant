//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef EPOTENTIAL_H
#define EPOTENTIAL_H

#include "Kernel.h"

class EPotential;

template <>
InputParameters validParams<EPotential>();

class EPotential : public Kernel
{
public:
  EPotential(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _ele_var;
  const VariableValue & _vac_var;

  unsigned int _e_var;
  unsigned int _v_var;

  Real _Dop;  /** Dopant fixed concentration ZA + O_2 --> 2AO */
  Real _ny;   /** Cation site density [mol/m^3] /**/
  Real _F;    /** 96485.0 */
  Real _nv;   /** Anion site density [mol/m^3] /**/
  Real _eps0; /** Physical parameters /**/
  Real _epsr; /** Material parameters /**/
};

#endif /* EPOTENTIAL_H */
