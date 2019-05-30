//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef LAGRANGE_H
#define LAGRANGE_H

#include "Kernel.h"

class Lagrange;

template <>
InputParameters validParams<Lagrange>();

class Lagrange : public Kernel
{
public:
  Lagrange(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;

  const VariableValue & _vac_var;

  unsigned int _v_var;

  Real _u_d; /** Lagrange multiplier */
};

#endif /* LAGRANGE_H */
