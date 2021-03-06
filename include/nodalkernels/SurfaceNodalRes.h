//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef SURFACENODALRES_H
#define SURFACENODALRES_H

#include "NodalKernel.h"

// Forward Declarations
class SurfaceNodalRes;

template <>
InputParameters validParams<SurfaceNodalRes>();

/**
 * Represents the rate in a simple ODE of du/dt = rate
 */
class SurfaceNodalRes : public NodalKernel
{
 public:
  /**
   * Constructor initializes the rate
   */
  SurfaceNodalRes(const InputParameters & parameters);

 protected:
  virtual Real computeQpResidual() override;

  virtual Real computeQpJacobian() override;

  const VariableValue & _ele_var;
  const VariableValue & _vac_var;

  unsigned int _e_var;
  unsigned int _v_var;

  Real _Ns;    /** Site density */
  Real _M;     /** Mobility */
  Real _R;     /** Gas constant */
  Real _T;     /** Temperature */
  Real _Pco;   /** CO partial pressure */
  Real _Pco2;  /** CO2 partial pressure */

  Real _eta1;  /** Pre-exponential factor */
  Real _eta2;  /** Pre-exponential factor */
  Real _dHdd1; /** dH**1 */
  Real _dHdd2; /** dH**2 */
  Real _dS1;   /** Entropy1 */
  Real _dS2;   /** Entropy2 */
  Real _dH1;   /** Enthalpy1 */
  Real _dH2;   /** Enthalpy2 */
  
};

#endif
