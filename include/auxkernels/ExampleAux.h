//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef EXAMPLEAUX_H
#define EXAMPLEAUX_H

#include "AuxKernel.h"

// Forward Declarations
class ExampleAux;

template <>
InputParameters validParams<ExampleAux>();

/**
 * Coupled auxiliary value
 */
class ExampleAux : public AuxKernel
{
public:
  /**
   * Factory constructor, takes parameters so that all derived classes can be built using the same
   * constructor.
   */
  ExampleAux(const InputParameters & parameters);

protected:
  virtual Real computeValue() override;

  const VariableValue & _coupled_val;

  Real _value;
};

#endif // EXAMPLEAUX_H

/*

#ifndef EXAMPLEAUX_H
#define EXAMPLEAUX_H

#include "AuxKernel.h"

class ExampleAux;

template<>
InputParameters validParams<ExampleAux>();

class ExampleAux : public AuxKernel
{
 public:

  ExampleAux(const std::string & name, InputParameters parameters);

 protected:
  virtual Real computeValue();

  VariableValue & _coupled_val;

  Real _value;
};

#endif //EXAMPLEAUX
*/
