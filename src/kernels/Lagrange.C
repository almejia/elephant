//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "Lagrange.h"
#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/io.hpp>
#include "func_bssanova_2.hpp"

registerMooseObject("MooseApp", Lagrange);

template <>
InputParameters
validParams<Lagrange>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("The Laplacian operator ($-\\nabla \\cdot \\nabla u$), with the weak "
                             "form of $(\\nabla \\phi_i, \\nabla u_h)$.");

  params.addRequiredCoupledVar("vac", "Coupled variable [vacancy concentration].");

  params.addParam<Real>("u_d", 0.1, "Lagrange multiplier"); //-1.603e9

  return params;
}

Lagrange::Lagrange(const InputParameters & parameters)
  : Kernel(parameters),

    _vac_var(coupledValue("vac")),

    _v_var(coupled("vac")),

    _u_d(getParam<Real>("u_d"))
{
}

Real
Lagrange::computeQpResidual()
{
  //  std::cout << "\nParam (u v): " << Par1[0] << " " << Par1[1] << "\t Betas: " << Betas1(0) << " " << Betas(1) << "\t Res: " << DiskRes << std::endl;

  //  return (_u[_qp] - (_vac_var[_qp] - _u_d)) * _test[_i][_qp];

  return (_u[_qp] - _u_d) * _test[_i][_qp];
}

Real
Lagrange::computeQpJacobian()
{
  return _test[_i][_qp] * _phi[_j][_qp];
}
/**/
