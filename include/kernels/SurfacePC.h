//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef SURFACEPC_H
#define SURFACEPC_H

#include "Kernel.h"

class SurfacePC;

template <>
InputParameters validParams<SurfacePC>();

class SurfacePC : public Kernel
{
public:
  SurfacePC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;

  Real _Ns;    /** Site density */
  Real _M;     /** Mobility */
  Real _R;     /** Gas constant */
  Real _T;     /** Temperature */
  
};

#endif /* SURFACEPC_H */
