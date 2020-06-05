#include "Vacancy1D.h"

registerMooseObject("MooseApp", Vacancy1D);

template <>
InputParameters
validParams<Vacancy1D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("ele", "Coupled variable u [electron concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");

  params.addRequiredCoupledVar("mu", "Coupled mu variable(chemical potential).");
  
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314 [J/mol-K])");
  params.addParam<Real>("T", 1673, "Temperature (T [K]).");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "nv", 8.2975e4, "Anion site density (nv [J/mol]). Default is 82975 = 8/(avnum*latpar^3).");
  params.addParam<Real>("nvv",
                        2.4893e5,
                        "Anion-Anion next nearest-neighbor bond density (nvv [J/mol]). Default is 165952 = "
                        "4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nqv",
      3.3190e5,
      "Anion-Cation next-nearest-neighbor bond density (nqv [J/mol]). Default is 331900 = 8*ny.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F [J/mol]). Default is 96485.");
  params.addParam<Real>("fv", 9e4, "Anion self interaction energy (fv [J/mol]). Default is 9e4.");
  params.addParam<Real>("fqv", -7e3, "Electron-Vacancy interaction energy (fqv [J/mol]). Default is -7e3.");
  params.addParam<Real>("gv", 1e-9, "Dopant gradient energy coefficient (gv [J/mol-m]). Default is 8e-9.");

  params.addParam<Real>("lambv", 1.3934712e9, "Lagrange multiplier"); // 1.3903e9

  return params;
}

Vacancy1D::Vacancy1D(const InputParameters & parameters)
  : Kernel(parameters),

    _ele_var(coupledValue("ele")),
    _phi_var(coupledValue("phi")),

    _mu_var(coupledValue("mu")),
    
    _e_var(coupled("ele")),
    _p_var(coupled("phi")),

    _m_var(coupled("mu")),


    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Dop(getParam<Real>("Dop")),
    _nv(getParam<Real>("nv")),
    _nvv(getParam<Real>("nvv")),
    _nqv(getParam<Real>("nqv")),
    _F(getParam<Real>("F")),
    _fv(getParam<Real>("fv")),
    _fqv(getParam<Real>("fqv")),
    _gv(getParam<Real>("gv")),

    _lambv(getParam<Real>("lambv"))
{
}

Real
Vacancy1D::computeQpResidual()
{
  return _gv * _grad_u[_qp] * _grad_test[_i][_qp] +
         ((_nv * 2 * _F * _phi_var[_qp]) + (_nqv * _fqv * _ele_var[_qp]) +
          2 * _nvv * _fv * _u[_qp] + _R * _T * _nv * log(_u[_qp] / (1 - _u[_qp])) + _lambv - /*_nv **/ _mu_var[_qp]) *
             _test[_i][_qp];
}

Real
Vacancy1D::computeQpJacobian()
{
  return +_gv * _grad_phi[_j][_qp] * _grad_test[_i][_qp] +
         2 * _nvv * _fv * _phi[_j][_qp] * _test[_i][_qp] +
         _R * _T * _nv * (1 / (_u[_qp] * (1 - _u[_qp]))) * _test[_i][_qp] * _phi[_j][_qp];
}

Real
Vacancy1D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _e_var)
  {
    return _nqv * _fqv * _test[_i][_qp] * _phi[_j][_qp];
  }

  if (jvar == _p_var)
  {
    return _nv * 2 * _F * _test[_i][_qp] * _phi[_j][_qp];
  }
  if (jvar == _m_var)
  {
    return -/*_nv **/ _test[_i][_qp] * _phi[_j][_qp];
  }
  
  return 0.0;
}
