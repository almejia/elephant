//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef VACANCY_H
#define VACANCY_H

#include "Kernel.h"

class Vacancy;

template <>
InputParameters validParams<Vacancy>();

class Vacancy : public Kernel
{
public:
  Vacancy(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _dop_var;
  const VariableValue & _phi_var;

  const PostprocessorValue & _pps_value;


  unsigned int _d_var;
  unsigned int _p_var;

  Real _R; /** Universal constant [J/mol*K] */
  Real _T; /** Temperature [K] */

  Real _Z;   /** Dopant chemcial formula index */
  Real _nv;  /** Cation site density [mol/m^3] */
  Real _nvv; /** Anion-anion density [mol/m^3] */
  Real _nyv; /** Anion-cation density [mol/m^3] */
  Real _F;   /** 96485.0 */
  Real _fv;  /** Dopant self-interaction [J/mol] */
  Real _fyv; /** Dopant-vacancy interaction [J/mol] */
  Real _cv;  /** Dopant gradient energy coefficient [J/mol-m] */

  Real _lambv; /** Lagrange multiplier */
};

#endif /* VACANCY_H */
