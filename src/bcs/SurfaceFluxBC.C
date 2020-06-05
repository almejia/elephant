
#include "SurfaceFluxBC.h"

registerMooseObject("MooseApp", SurfaceFluxBC);

template <>
InputParameters
validParams<SurfaceFluxBC>()
{
  InputParameters params = validParams<IntegratedBC>();

  // Specify input parameters that we want users to be able to set:
  
  params.addRequiredCoupledVar("theta", "The name for coupled surface adsorbate variable.");

  params.addParam<Real>("Ns", 1.3e-5, "Surface site density (No). Default is 1.3e-5.");
  params.addParam<Real>("F", 96485, "Energy constant (F)");

  return params;
}

SurfaceFluxBC::SurfaceFluxBC(const InputParameters & parameters)
  : IntegratedBC(parameters),
    _the_var(coupledValue("theta")),
    
    _t_var(coupled("theta")),

    _Ns(getParam<Real>("Ns")),
    _F(getParam<Real>("F"))

{
}

Real
SurfaceFluxBC::computeQpResidual()
{
  // For this Neumann BC grad(u)=alpha * v on the boundary.
  // We use the term produced from integrating the diffusion operator by parts.
  return (_Ns * _F * _the_var[_qp]) * _test[_i][_qp] ;
}


