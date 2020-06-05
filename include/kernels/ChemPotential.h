//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef CHEMPOTENTIAL_H
#define CHEMPOTENTIAL_H

#include "Kernel.h"

class ChemPotential;

template <>
InputParameters validParams<ChemPotential>();

class ChemPotential : public Kernel
{
public:
  ChemPotential(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _con_var;

  unsigned int _c_var;

  Real _Ns; /** Site density */
  Real _M;  /** Mobility */

};

#endif /* CHEMPOTENTIAL_H */
