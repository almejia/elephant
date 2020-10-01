//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef CMATCHEDVALUE2DBC_H
#define CMATCHEDVALUE2DBC_H

#include "NodalBC.h"

// Forward Declarations
class CMatchedValue2DBC;

template <>
InputParameters validParams<CMatchedValue2DBC>();

/**
 * Implements a simple coupled boundary condition where u=v on the boundary.
 */
class CMatchedValue2DBC : public NodalBC
{
public:
  CMatchedValue2DBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _v;

  /// The id of the coupled variable
  unsigned int _v_num;

  Real _R;
  Real _T;
  Real _nv;
  Real _xv;
  Real _F;   /** 96485.0 */
  Real _ysz_0;

};

#endif // CMATCHEDVALUE2DBC_H
