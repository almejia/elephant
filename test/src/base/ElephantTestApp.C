//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#include "ElephantTestApp.h"
#include "ElephantApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"
#include "ModulesApp.h"

template <>
InputParameters
validParams<ElephantTestApp>()
{
  InputParameters params = validParams<ElephantApp>();
  return params;
}

ElephantTestApp::ElephantTestApp(InputParameters parameters) : MooseApp(parameters)
{
  Moose::registerObjects(_factory);
  ModulesApp::registerObjects(_factory);
  ElephantApp::registerObjectDepends(_factory);
  ElephantApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  ModulesApp::associateSyntax(_syntax, _action_factory);
  ElephantApp::associateSyntaxDepends(_syntax, _action_factory);
  ElephantApp::associateSyntax(_syntax, _action_factory);

  Moose::registerExecFlags(_factory);
  ModulesApp::registerExecFlags(_factory);
  ElephantApp::registerExecFlags(_factory);

  bool use_test_objs = getParam<bool>("allow_test_objects");
  if (use_test_objs)
  {
    ElephantTestApp::registerObjects(_factory);
    ElephantTestApp::associateSyntax(_syntax, _action_factory);
    ElephantTestApp::registerExecFlags(_factory);
  }
}

ElephantTestApp::~ElephantTestApp() {}

void
ElephantTestApp::registerApps()
{
  registerApp(ElephantApp);
  registerApp(ElephantTestApp);
}

void
ElephantTestApp::registerObjects(Factory & /*factory*/)
{
  /* Uncomment Factory parameter and register your new test objects here! */
}

void
ElephantTestApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
  /* Uncomment Syntax and ActionFactory parameters and register your new test objects here! */
}

void
ElephantTestApp::registerExecFlags(Factory & /*factory*/)
{
  /* Uncomment Factory parameter and register your new execute flags here! */
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
// External entry point for dynamic application loading
extern "C" void
ElephantTestApp__registerApps()
{
  ElephantTestApp::registerApps();
}

// External entry point for dynamic object registration
extern "C" void
ElephantTestApp__registerObjects(Factory & factory)
{
  ElephantTestApp::registerObjects(factory);
}

// External entry point for dynamic syntax association
extern "C" void
ElephantTestApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory)
{
  ElephantTestApp::associateSyntax(syntax, action_factory);
}

// External entry point for dynamic execute flag loading
extern "C" void
ElephantTestApp__registerExecFlags(Factory & factory)
{
  ElephantTestApp::registerExecFlags(factory);
}
