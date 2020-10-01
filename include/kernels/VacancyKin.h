//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef VACANCYKIN_H
#define VACANCYKIN_H

#include "Kernel.h"

class VacancyKin;

template <>
InputParameters validParams<VacancyKin>();

class VacancyKin : public Kernel
{
public:
  VacancyKin(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _ele_var;
  const VariableValue & _phi_var;
  const VariableValue & _mu_var;
  
  unsigned int _e_var;
  unsigned int _p_var;
  unsigned int _m_var;
  
  Real _R; /** Universal constant [J/mol*K] */
  Real _T; /** Temperature [K] */

  Real _Dop; /** Dopant fixed concentration */
  Real _nv;  /** Cation site density [mol/m^3] */
  Real _nvv; /** Anion-anion density [mol/m^3] */
  Real _nqv; /** Anion-cation density [mol/m^3] */
  Real _F;   /** 96485.0 */
  Real _fv;  /** Dopant self-interaction [J/mol] */
  Real _fqv; /** Dopant-vacancy interaction [J/mol] */
  Real _gv;  /** Dopant gradient energy coefficient [J/mol-m] */

  Real _lambv; /** Lagrange multiplier */
};

#endif /* VACANCYKIN_H */
