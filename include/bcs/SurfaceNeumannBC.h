
#pragma once

#include "IntegratedBC.h"

class SurfaceNeumannBC;

template <>
InputParameters validParams<SurfaceNeumannBC>();

/**
 * Implements a simple constant Neumann BC where grad(u)=alpha * v on the boundary.
 * Uses the term produced from integrating the diffusion operator by parts.
 */
class SurfaceNeumannBC : public IntegratedBC
{
public:
  SurfaceNeumannBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  
  Real _Ns;    /** Surface site density */
  Real _fo;     /** Energy constant */

};

