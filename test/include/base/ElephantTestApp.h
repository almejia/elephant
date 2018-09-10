//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#ifndef ELEPHANTTESTAPP_H
#define ELEPHANTTESTAPP_H

#include "MooseApp.h"

class ElephantTestApp;

template <>
InputParameters validParams<ElephantTestApp>();

class ElephantTestApp : public MooseApp
{
public:
  ElephantTestApp(InputParameters parameters);
  virtual ~ElephantTestApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
  static void registerExecFlags(Factory & factory);
};

#endif /* ELEPHANTTESTAPP_H */
