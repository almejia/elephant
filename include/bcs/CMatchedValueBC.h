//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef CMATCHEDVALUEBC_H
#define CMATCHEDVALUEBC_H

#include "NodalBC.h"

// Forward Declarations
class CMatchedValueBC;

template <>
InputParameters validParams<CMatchedValueBC>();

/**
 * Implements a simple coupled boundary condition where u=v on the boundary.
 */
class CMatchedValueBC : public NodalBC
{
public:
  CMatchedValueBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _v;

  /// The id of the coupled variable
  unsigned int _v_num;

  Real _F;   /** 96485.0 */
  Real _ysz_0;

};

#endif // CMATCHEDVALUEBC_H
