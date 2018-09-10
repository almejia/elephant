//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef GRADIENTENERGY_H
#define GRADIENTENERGY_H

#include "Kernel.h"

class GradientEnergy;

template <>
InputParameters validParams<GradientEnergy>();

/**
 * This kernel implements the Laplacian operator:
 * $\nabla u \cdot \nabla \phi_i$
 */
class GradientEnergy : public Kernel
{
public:
  GradientEnergy(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;

  Real _cg; /** Dopant gradient energy coefficient [J/mol-m] */
};

#endif /* GRADIENTENERGY_H */
