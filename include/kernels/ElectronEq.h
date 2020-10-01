//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef ELECTRONEQ_H
#define ELECTRONEQ_H

#include "Kernel.h"

class ElectronEq;

template <>
InputParameters validParams<ElectronEq>();

class ElectronEq : public Kernel
{
public:
  ElectronEq(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _vac_var;
  const VariableValue & _phi_var;
  
  unsigned int _v_var;
  unsigned int _p_var;
  
  Real _R; /** Universal constant [J/mol*K] */
  Real _T; /** Temperature [K] */

  Real _Dop; /** Dopant fixed concentration */
  Real _nq;  /** Cation site density [mol/m^3] */
  Real _nqq; /** Cation-cation density [mol/m^3] */
  Real _nqv; /** Anion-cation density [mol/m^3] */
  Real _F;   /** 96485.0 */
  Real _fq;  /** Dopant self-interaction [J/mol] */
  Real _fqv; /** Dopant-vacancy interaction [J/mol] */
  Real _gq;  /** Dopant gradient energy coefficient [J/mol-m] */

  Real _lambd; /** Lagrange multiplier */
};

#endif /* ELECTRONEQ_H */
