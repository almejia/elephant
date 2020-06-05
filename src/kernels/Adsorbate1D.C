#include "Adsorbate1D.h"

registerMooseObject("MooseApp", Adsorbate1D);

template <>
InputParameters
validParams<Adsorbate1D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("mu", "Coupled variable mu (chemical potential).");
  
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314 [J/mol])");
  params.addParam<Real>("T", 1673, "Temperature (T [K]).");

  params.addParam<Real>(
      "nq", 4.1488e4, "Electron (Cation) site density (nq [mol/m^3]). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nqq",
      1.6595e5,
      "Electron-Electron (Cation-Cation) next-nearest-neighbor bond density (nqq [mol/m^3]). Default is 165952 = 4*nq.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F [J/mol]). Default is 96485.");
  params.addParam<Real>("fq", 90000.0, "Electron (Dopant) self interaction energy (fq [J/mol]). Default is 9e4.");

  return params;
}

Adsorbate1D::Adsorbate1D(const InputParameters & parameters)
  : Kernel(parameters),

    _mu_var(coupledValue("mu")),

    _m_var(coupled("mu")),

    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _nq(getParam<Real>("nq")),
    _nqq(getParam<Real>("nqq")),
    _F(getParam<Real>("F")),
    _fq(getParam<Real>("fq"))
{
}

Real
Adsorbate1D::computeQpResidual()
{
  return (_R * _T * _nq * log(_u[_qp] / (1 - _u[_qp])) - _mu_var[_qp]) * _test[_i][_qp];
}

Real
Adsorbate1D::computeQpJacobian()
{ 
  return _R * _T * _nq * (1 / (_u[_qp] * (1 - _u[_qp]))) * _test[_i][_qp] * _phi[_j][_qp];
}

Real
Adsorbate1D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _m_var)
  {
    return -/**_nq **/ _test[_i][_qp] * _phi[_j][_qp];
  }
  
  return 0.0;
}
