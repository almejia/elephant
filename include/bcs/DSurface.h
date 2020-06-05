
#pragma once

#include "NodalBC.h"

class DSurface;

template <>
InputParameters validParams<DSurface>();

/**
 * Implements a simple constant Neumann BC where grad(u)=alpha * v on the boundary.
 * Uses the term produced from integrating the diffusion operator by parts.
 */
class DSurface : public NodalBC
{
public:
  DSurface(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

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

