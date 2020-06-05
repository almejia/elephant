#include "EPotential2D.h"

registerMooseObject("MooseApp", EPotential2D);

template <>
InputParameters
validParams<EPotential2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("ele", "The variable for dopant concentration.");
  params.addRequiredCoupledVar("vac", "The variable for vacancy concentration.");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "nq", 41488.0, "Cation site density (nq [J/mol]). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("F", 96485.0, "Energy constant (F [J/mol]). Default is 96485.");
  params.addParam<Real>("nv", 82976.0, "Anion site density (nv [J/mol]). Default is 92976 = 2*ny.");
  params.addParam<Real>("eps0", 8.85e-12, "Physicial parameter. Default is 8.85e-12.");
  params.addParam<Real>("epsr", 35.0, "Material parameter. Default is 35.");

  return params;
}

EPotential2D::EPotential2D(const InputParameters & parameters)
  : Kernel(parameters),

    _ele_var(coupledValue("ele")),
    _vac_var(coupledValue("vac")),

    _e_var(coupled("ele")),
    _v_var(coupled("vac")),

    _Dop(getParam<Real>("Dop")),
    _nq(getParam<Real>("nq")),
    _F(getParam<Real>("F")),
    _nv(getParam<Real>("nv")),
    _eps0(getParam<Real>("eps0")),
    _epsr(getParam<Real>("epsr"))
{
}

Real
EPotential2D::computeQpResidual()
{
  return -(_eps0 * _epsr) * _grad_u[_qp] * _grad_test[_i][_qp] +
         (_F * (2 * _nv * _vac_var[_qp] - _nq * _Dop - _nq * _ele_var[_qp])) * _test[_i][_qp];
}

Real
EPotential2D::computeQpJacobian()
{
  return -(_eps0 * _epsr) * _grad_phi[_j][_qp] * _grad_test[_i][_qp];
}

Real
EPotential2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _e_var)
  {
    return -_F * _nq * _test[_i][_qp] * _phi[_j][_qp];
  }

  else if (jvar == _v_var)
  {
    return _F * 2 * _nv * _test[_i][_qp] * _phi[_j][_qp];
  }

  return 0.0;
}

