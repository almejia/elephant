//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "PostprocessorCED.h"

// MOOSE includes
#include "Assembly.h"
#include "MooseVariableScalar.h"

registerMooseObject("MooseApp", PostprocessorCED);

template <>
InputParameters
validParams<PostprocessorCED>()
{
  InputParameters params = validParams<ScalarKernel>();
  params.addClassDescription("This class is used to solve a constrained Neumann problem with a "
                             "Lagrange multiplier approach.");
  params.addRequiredParam<PostprocessorName>(
      "pp_name", "Name of the Postprocessor value we are trying to equate with 'value'.");
  params.addRequiredParam<Real>(
      "value", "Given (constant) which we want the integral of the solution variable to match.");

  return params;
}

PostprocessorCED::PostprocessorCED(const InputParameters & parameters)
  : ScalarKernel(parameters),
    _value(getParam<Real>("value")),
    _pp_value(getPostprocessorValue("pp_name"))
{
}

PostprocessorCED::~PostprocessorCED() {}

void
PostprocessorCED::reinit()
{
}

void
PostprocessorCED::computeResidual()
{
  DenseVector<Number> & re = _assembly.residualBlock(_var.number());
  for (_i = 0; _i < re.size(); _i++)
    re(_i) += computeQpResidual();
}

Real
PostprocessorCED::computeQpResidual()
{
  return _pp_value - _value;
}

void
PostprocessorCED::computeJacobian()
{
  DenseMatrix<Number> & ke = _assembly.jacobianBlock(_var.number(), _var.number());
  for (_i = 0; _i < ke.m(); _i++)
    ke(_i, _i) += computeQpJacobian();
}

Real
PostprocessorCED::computeQpJacobian()
{
  // Note: Here, the true on-diagonal Jacobian contribution is
  // actually zero, i.e. we are not making any approximation
  // here. That is because the "lambda"-equation in this system of
  // equations does not depend on lambda. For more information, see
  // the detailed writeup [0].
  //
  // [0]: https://github.com/idaholab/large_media/blob/master/scalar_constraint_kernel.pdf
  return 0.;
}

void
PostprocessorCED::computeOffDiagJacobian(unsigned int /*jvar*/)
{
}

Real
PostprocessorCED::computeQpOffDiagJacobian(unsigned int /*jvar*/)
{
  // The off-diagonal contribution for this ScalarKernel (derivative
  // wrt the "primal" field variable) is not _actually_ zero, but we
  // are computing it elsewhere (see ScalarLagrangeMultiplier.C) so
  // here we simply return zero. For more information on this, see the
  // detailed writeup [0].
  //
  // [0]: https://github.com/idaholab/large_media/blob/master/scalar_constraint_kernel.pdf
  return 0.;
}
