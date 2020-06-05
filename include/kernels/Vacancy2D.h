#ifndef VACANCY2D_H
#define VACANCY2D_H

#include "Kernel.h"

class Vacancy2D;

template <>
InputParameters validParams<Vacancy2D>();

class Vacancy2D : public Kernel
{
public:
  Vacancy2D(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _ele_var;
  const VariableValue & _phi_var;

  const VariableValue & _mu_var;
  
  unsigned int _e_var;
  unsigned int _p_var;

  unsigned int _m_var;
  
  Real _R; /** Universal constant [J/mol*K] */
  Real _T; /** Temperature [K] */

  Real _Dop; /** Dopant fixed concentration */
  Real _nv;  /** Anion site density [mol/m^3] */
  Real _nvv; /** Anion-Anion density [mol/m^3] */
  Real _nqv; /** Anion-Cation density [mol/m^3] */
  Real _F;   /** 96485.0 [J/mol] */
  Real _fv;  /** Anion self-interaction [J/mol] */
  Real _fqv; /** Electron-Vacancy interaction [J/mol] */
  Real _fyv; /** Dopant-Vacancy interaction [J/mol] */
  Real _gv;  /** Vacancy gradient energy coefficient [J/mol-m] */

  Real _lambv; /** Lagrange multiplier */
};

#endif /* VACANCY2D_H */

