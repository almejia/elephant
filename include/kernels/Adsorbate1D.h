#ifndef ADSORBATE1D_H
#define ADSORBATE1D_H

#include "Kernel.h"

class Adsorbate1D;

template <>
InputParameters validParams<Adsorbate1D>();

class Adsorbate1D : public Kernel
{
public:
  Adsorbate1D(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _mu_var;
  
  unsigned int _m_var;
  
  Real _R; /** Universal constant [J/mol*K] */
  Real _T; /** Temperature [K] */

  Real _nq;  /** Cation site density [mol/m^3] */
  Real _nqq; /** Cation-cation density [mol/m^3] */
  Real _F;   /** 96485.0 */
  Real _fq;  /** Dopant self-interaction [J/mol] */
};

#endif /* ADSORBATE1D_H */


