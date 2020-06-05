#ifndef EPOTENTIAL2D_H
#define EPOTENTIAL2D_H

#include "Kernel.h"

class EPotential2D;

template <>
InputParameters validParams<EPotential2D>();

class EPotential2D : public Kernel
{
public:
  EPotential2D(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _ele_var;
  const VariableValue & _vac_var;

  unsigned int _e_var;
  unsigned int _v_var;

  Real _Dop;  /** Dopant fixed concentration ZA + O_2 --> 2AO */
  Real _nq;   /** Cation site density [mol/m^3] /**/
  Real _F;    /** 96485.0 */
  Real _nv;   /** Anion site density [mol/m^3] /**/
  Real _eps0; /** Physical parameters /**/
  Real _epsr; /** Material parameters /**/
};

#endif /* EPOTENTIAL2D_H */

