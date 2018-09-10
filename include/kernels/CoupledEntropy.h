//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef COUPLEDENTROPY_H
#define COUPLEDENTROPY_H

#include "Kernel.h"

class CoupledEntropy;

template <>
InputParameters validParams<CoupledEntropy>();

/**
 * This kernel implements the Laplacian operator:
 * $\nabla u \cdot \nabla \phi_i$
 */
class CoupledEntropy : public Kernel
{
public:
  CoupledEntropy(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _coup_var;
  const VariableValue & _phi_var;

  unsigned int _c_var;
  unsigned int _p_var;

  Real _Z;   /** Dopant chemcial formula index */
  Real _ny;  /** Cation site density [mol/m^3] */
  Real _nyy; /** Cation-cation density [mol/m^3] */
  Real _nyv; /** Anion-cation density [mol/m^3] */
  Real _F;   /** 96485.0 */
  Real _fy;  /** Dopant self-interaction [J/mol] */
  Real _fyv; /** Dopant-vacancy interaction [J/mol] */

  Real _lambd; /** Lagrange multiplier */
};

#endif /* COUPLEDENTROPY_H */
