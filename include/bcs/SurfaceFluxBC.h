
#pragma once

#include "IntegratedBC.h"

class SurfaceFluxBC;

template <>
InputParameters validParams<SurfaceFluxBC>();

/**
 * Implements a simple constant Neumann BC where grad(u)=alpha * v on the boundary.
 * Uses the term produced from integrating the diffusion operator by parts.
 */
class SurfaceFluxBC : public IntegratedBC
{
public:
  SurfaceFluxBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  const VariableValue & _the_var;

  unsigned int _t_var;

  Real _Ns;    /** Surface site density */
  Real _F;     /** Energy constant */

};

