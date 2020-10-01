
#include "SurfaceNeumannBC.h"

registerMooseObject("MooseApp", SurfaceNeumannBC);

template <>
InputParameters
validParams<SurfaceNeumannBC>()
{
  InputParameters params = validParams<IntegratedBC>();

  // Specify input parameters that we want users to be able to set:
  
  params.addParam<Real>("Ns", 1.3e-5, "Surface site density (No). Default is 1.3e-5.");
  params.addParam<Real>("fo", 96485, "Surface affinity energy (fo)");

  return params;
}

SurfaceNeumannBC::SurfaceNeumannBC(const InputParameters & parameters)
  : IntegratedBC(parameters),

    _Ns(getParam<Real>("Ns")),
    _fo(getParam<Real>("fo"))

{
}

Real
SurfaceNeumannBC::computeQpResidual()
{
  // For this Neumann BC grad(u)=alpha * v on the boundary.
  // We use the term produced from integrating the diffusion operator by parts.
  return -(_Ns * _fo) * _test[_i][_qp] ;
}


