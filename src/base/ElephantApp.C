#include "ElephantApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

template <>
InputParameters
validParams<ElephantApp>()
{
  InputParameters params = validParams<MooseApp>();
  return params;
}

ElephantApp::ElephantApp(InputParameters parameters) : MooseApp(parameters)
{
  Moose::registerObjects(_factory);
  ModulesApp::registerObjects(_factory);
  ElephantApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  ModulesApp::associateSyntax(_syntax, _action_factory);
  ElephantApp::associateSyntax(_syntax, _action_factory);

  Moose::registerExecFlags(_factory);
  ModulesApp::registerExecFlags(_factory);
  ElephantApp::registerExecFlags(_factory);
}

ElephantApp::~ElephantApp() {}

void
ElephantApp::registerApps()
{
  registerApp(ElephantApp);
}

void
ElephantApp::registerObjects(Factory & factory)
{
    Registry::registerObjectsTo(factory, {"ElephantApp"});
}

void
ElephantApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & action_factory)
{
  Registry::registerActionsTo(action_factory, {"ElephantApp"});

  /* Uncomment Syntax parameter and register your new production objects here! */
}

void
ElephantApp::registerObjectDepends(Factory & /*factory*/)
{
}

void
ElephantApp::associateSyntaxDepends(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
}

void
ElephantApp::registerExecFlags(Factory & /*factory*/)
{
  /* Uncomment Factory parameter and register your new execution flags here! */
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
ElephantApp__registerApps()
{
  ElephantApp::registerApps();
}

extern "C" void
ElephantApp__registerObjects(Factory & factory)
{
  ElephantApp::registerObjects(factory);
}

extern "C" void
ElephantApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory)
{
  ElephantApp::associateSyntax(syntax, action_factory);
}

extern "C" void
ElephantApp__registerExecFlags(Factory & factory)
{
  ElephantApp::registerExecFlags(factory);
}
