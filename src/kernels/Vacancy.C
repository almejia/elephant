//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "Vacancy.h"
//#include "Dopant.C"
//#include <boost/numeric/ublas/vector.hpp>
//#include "funeval_base.hpp"
//#include "func_bssanova_2.hpp"

registerMooseObject("MooseApp", Vacancy);

template <>
InputParameters
validParams<Vacancy>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("dop", "Coupled variable [dopant concentration].");
  params.addRequiredCoupledVar("phi", "Coupled variable Phi (electrostatic potential).");

  params.addParam<Real>("R", 8.314, "Universal constant (R = 8.314)");
  params.addParam<Real>("T", 1673, "Temperature (T).");

  params.addParam<Real>("Z", 2, "Dopant chemical formula index");
  params.addParam<Real>(
      "nv", 8.2975e4, "Cation site density (ny). Default is 41488 = 4/(avnum*latpar^3).");
  params.addParam<Real>("nvv",
                        2.4893e5,
                        "Anion-anion next nearest-neighbor bond density (nvv). Default is 165952 = "
                        "4/(avnum*latpar^3).");
  params.addParam<Real>(
      "nyv",
      3.3190e5,
      "Anion-cation next-nearest-neighbor bond density (nyv). Default is 331900 = 8*ny.");
  params.addParam<Real>("F", 96485.0, "Energy constant (F). Default is 96485.");
  params.addParam<Real>("fv", 9e4, "Dopant self interaction energy (fy). Default is 9e4.");
  params.addParam<Real>("fyv", -7e3, "Dopant-vacancy interaction energy (fyv). Default is -7e3.");
  params.addParam<Real>("cv", 1e-9, "Dopant gradient energy coefficient (cd). Default is 8e-9.");

  params.addParam<Real>("lambv", 1.3934712e9, "Lagrange multiplier"); // 1.3903e9

  return params;
}

Vacancy::Vacancy(const InputParameters & parameters)
  : Kernel(parameters),

    _dop_var(coupledValue("dop")),
    _phi_var(coupledValue("phi")),

    _d_var(coupled("dop")),
    _p_var(coupled("phi")),

    _R(getParam<Real>("R")),
    _T(getParam<Real>("T")),

    _Z(getParam<Real>("Z")),
    _nv(getParam<Real>("nv")),
    _nvv(getParam<Real>("nvv")),
    _nyv(getParam<Real>("nyv")),
    _F(getParam<Real>("F")),
    _fv(getParam<Real>("fv")),
    _fyv(getParam<Real>("fyv")),
    _cv(getParam<Real>("cv")),

    _lambv(getParam<Real>("lambv"))
{
}

Real
Vacancy::computeQpResidual()
{
  /*  boost::numeric::ublas::vector<double> Betas, Betas1;
  //  boost::numeric::ublas::vector<double> Beta_v;
  //  boost::numeric::ublas::vector<double> Beta_vy;
  //  boost::numeric::ublas::vector<double> Beta_vp;

  boost::numeric::ublas::vector<double> Par;
  //  boost::numeric::ublas::vector<double> Par_V;
  //  boost::numeric::ublas::vector<double> Par_D;
  //  boost::numeric::ublas::vector<double> Par_P;
  
  //  func_bssanova DiskFunc;
  //  bool diskOn = false;
  //  std::string DiskFile = "config/config_Discrepancy.txt";

  func_bssanova DiskFunc_vp;
  double diskRes_vp = 0;
  double diskDer_vp = 0;
  bool diskOn = false;
  std::string DiskFile_vp = "config/config_Disc_vp.txt";

  //  diskOn = DiskFunc.SplineConfig(DiskFile);
  //  if (!diskOn) {
  //    std::cout << "There is an issue with the Discrepancy file configuration" << std::endl;
  //   return 0;
  //  }

  diskOn = DiskFunc_vp.SplineConfig(DiskFile_vp);
  if (!diskOn) {
    std::cout << "There is an issue with the Discrepancy file configuration" << std::endl;
   return 0;
  }
  
  Betas.resize(5);
  Betas[0] = 1.9002e10; // B_v1
  Betas[1] = 0.6241e10; // B_v2
  Betas[2] = -2.0418e9; // B_vy
  Betas[3] = 6.3635e-9; // B_vp
  Betas[4] = 0;         // B_vvp
  
  Betas1.resize(DiskFunc_vp.betsize());
  Par.resize(2);
  
  Par[0] = _u[_qp]; // 0.4375;
  Par[1] =  _dop_var[_qp];
  
  //  Par_V.resize(1);
  //  Par_D.resize(1);
  //  Par_P.resize(1);

  //  std::cout << Betas[0];
  //  Betas[0] = 1.9002e10;
  //  Beta_v[0] = 1.9002e10;
  //  Beta_v[1] = 0.6241e10;
  //  Par[0] = _u[_qp];
  //  Par_V[0] = _u[_qp];
  //  Par_D[0] = _dop_var[_qp];
  //  Par_P[0] = _phi_var[_qp];

  for (int i = 0; i < Betas1.size(); i++) {
    Betas1[i] = Betas[i];
  }

  //  DiskFunc.SplineEval(Par,Betas,diskRes);
  //  DiskFunc.SplineDeriv(0,Par,Betas,diskDer);
  //  std::cout << std::endl << diskRes << " " << diskDer << " " << _u[_qp] << std::endl;

  DiskFunc_vp.SplineEval(Par,Betas1,diskRes_vp);
  DiskFunc_vp.SplineDeriv2(0,Par,Betas1,diskDer_vp);
  //  std::cout << std::endl << diskRes_vp << " " << diskDer_vp << " " << _u[_qp] << std::endl; */
  
  /*  
  return ((_nv * 2 * _F * _phi_var[_qp]) + _R * _T * _nv * log(_u[_qp] / (1 - _u[_qp])) + _lambv +
	  diskDer_vp) * _test[_i][_qp];

	  }/**/
//  return _cv * _grad_u[_qp] * _grad_test[_i][_qp] +
//         ((_nv * 2 * _F * _phi_var[_qp]) + (_nyv * _fyv * _dop_var[_qp]) +
//          2 * _nvv * _fv * _u[_qp] + _R * _T * _nv * log(_u[_qp] / (1 - _u[_qp])) + _lambv) *
//             _test[_i][_qp];
//*
  return _cv * _grad_u[_qp] * _grad_test[_i][_qp] +
         ((_nv * 2 * _F * _phi_var[_qp]) + (_nyv * _fyv * _dop_var[_qp]) +
          2 * _nvv * _fv * _u[_qp] + _R * _T * _nv * log(_u[_qp] / (1 - _u[_qp])) + _lambv) *
             _test[_i][_qp];

} //*/

//*
Real
Vacancy::computeQpJacobian()
{
  return +_cv * _grad_phi[_j][_qp] * _grad_test[_i][_qp] +
         2 * _nvv * _fv * _phi[_j][_qp] * _test[_i][_qp] +
         _R * _T * _nv * (1 / (_u[_qp] * (1 - _u[_qp]))) * _test[_i][_qp] * _phi[_j][_qp];
}
/**/

Real
Vacancy::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _d_var)
  {
    return _nyv * _fyv * _test[_i][_qp] * _phi[_j][_qp];
  }

  if (jvar == _p_var)
  {
    return _nv * 2 * _F * _test[_i][_qp] * _phi[_j][_qp];
  }

  return 0.0;
}
