#include "Electron2D.h"

registerMooseObject("MooseApp", Electron2D);

template <>
InputParameters
validParams<Electron2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("vac", "Coupled variable [vacancy concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");

  params.addRequiredCoupledVar("mu", "Coupled variable mu (chemical potential).");
  
  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314 [J/mol])");
  params.addParam<Real>("T", 1673, "Temperature (T [K]).");

  params.addParam<Real>("Dop", 0.1, "Dopant fixed concentration");
  params.addParam<Real>(
      "nq", 4.1488e4, "Electron (Cation) site density (nq [mol/m^3]). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nqq",
      1.6595e5,
      "Electron-Electron (Cation-Cation) next-nearest-neighbor bond density (nqq [mol/m^3]). Default is 165952 = 4*nq.");
  params.addParam<Real>(
      "nqv",
      3.3190e5,
      "Anion-Electron (Cation) next-nearest-neighbor bond density (nyv [mol/m^3]). Default is 331900 = 8*nq.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F [J/mol]). Default is 96485.");
  params.addParam<Real>("fq", 90000.0, "Electron (Dopant) self interaction energy (fq [J/mol]). Default is 9e4.");
  params.addParam<Real>(
      "fqv", -7000.0, "Electron-Vacancy interaction energy (fqv [J/mol]). Default is -7e3.");
  params.addParam<Real>(
      "fqy", 5000.0, "Electron-Cation interaction energy (fqv [J/mol]). Default is 5e3.");
  params.addParam<Real>("gq", 8e-9, "Electron gradient energy coefficient (gq [J/mol-m]). Default is 8e-9.");

  params.addParam<Real>("lambq", -1.599515214e9, "Lagrange multiplier"); //-1.603e9

  return params;
}

Electron2D::Electron2D(const InputParameters & parameters)
  : Kernel(parameters),

    _vac_var(coupledValue("vac")),
    _phi_var(coupledValue("phi")),

    _mu_var(coupledValue("mu")),

    _v_var(coupled("vac")),
    _p_var(coupled("phi")),

    _m_var(coupled("mu")),

    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Dop(getParam<Real>("Dop")),
    _nq(getParam<Real>("nq")),
    _nqq(getParam<Real>("nqq")),
    _nqv(getParam<Real>("nqv")),
    _F(getParam<Real>("F")),
    _fq(getParam<Real>("fq")),
    _fqv(getParam<Real>("fqv")),
    _fqy(getParam<Real>("fqy")),
    _gq(getParam<Real>("gq")),

    _lambq(getParam<Real>("lambq"))
{
}

Real
Electron2D::computeQpResidual()
{
    return _gq * _grad_u[_qp] * _grad_test[_i][_qp] +
          ((-_nq * _F * _phi_var[_qp]) + (_nqv * _fqv * _vac_var[_qp]) + (_nqq * _fqy *_Dop) +
	   2 * _nqq * _fq * _u[_qp] + _R * _T * _nq * log(_u[_qp] / (1 - _u[_qp] - _Dop)) + _lambq - /*_nq**/_mu_var[_qp]) *
	  _test[_i][_qp];
}

Real
Electron2D::computeQpJacobian()
{ 
  return +_gq * _grad_phi[_j][_qp] * _grad_test[_i][_qp] +
         2 * _nqq * _fq * _test[_i][_qp] * _phi[_j][_qp] +
         _R * _T * _nq * ((1 - _Dop) / (_u[_qp] * (1 - _u[_qp] - _Dop))) * _test[_i][_qp] * _phi[_j][_qp];
}

Real
Electron2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _v_var)
  {
    return _nqv * _fqv * _test[_i][_qp] * _phi[_j][_qp];
  }

  if (jvar == _p_var)
  {
    return -_nq * _F * _test[_i][_qp] * _phi[_j][_qp];
  }
  if (jvar == _m_var)
  {
    return -/*_nq **/ _test[_i][_qp] * _phi[_j][_qp];
  }
  
  return 0.0;
}
