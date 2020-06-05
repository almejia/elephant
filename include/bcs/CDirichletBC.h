//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef CDIRICHLETBC_H
#define CDIRICHLETBC_H

#include "NodalBC.h"

class CDirichletBC;

template <>
InputParameters validParams<CDirichletBC>();

/**
 * Boundary condition of a Dirichlet type
 *
 * Sets the value in the node
 */
class CDirichletBC : public NodalBC
{
public:
  CDirichletBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  /// The value for this BC
  const Real & _var1;
  const Real & _var2;
};

#endif /* CDIRICHLETBC_H */
