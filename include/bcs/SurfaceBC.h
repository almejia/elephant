//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "IntegratedBC.h"

class SurfaceBC;

template <>
InputParameters validParams<SurfaceBC>();

/**
 * Implements a simple constant Neumann BC where grad(u)=alpha * v on the boundary.
 * Uses the term produced from integrating the diffusion operator by parts.
 */
class SurfaceBC : public IntegratedBC
{
public:
  SurfaceBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

private:
  /// Multiplier on the boundary.
  Real _alpha;
  Real _R;
  Real _T;
  Real _Pco;
  Real _Pco2;
  Real _eta1;
  Real _eta2;
  Real _dHdd1;
  Real _dHdd2;
  Real _dS1;
  Real _dS2;
  Real _dH1;
  Real _dH2;
  /*  Real _u;*/
  Real _n;

  /*  const VariableValue & _theta_var;*/
  const VariableValue & _ele_var;
  const VariableValue & _vac_var;
  /*  const VariableValue & _some_var;*/
};

