## Input file for ElePhaNT MOOSE app  

[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 125 # Number of elements in X-direction 
  ny = 1
  xmax = 5e-7 # Half grain size [m] = 500 [nm]
  ymax = 5e-8 # 2D y-size for viewing mesh refinement
  bias_x = 1.05 # bias 0.5 - 2.0 (left - right element-size refinement)
[]

[Variables]
active = 'u v phi'

  [./u]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.05
    scaling = 1 
  [../]
  [./phi]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
  [../]

  [./lambda]
    family = SCALAR
    order = FIRST
  [../]

[]

[AuxVariables]
  [./lagrange_test]
    order = FIRST
    family = LAGRANGE
  [../]

  [./bounds_dummy]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
active = 'phi_kernel dopant_kernel vacancy_kernel'

  [./phi_kernel]
    type = EDiffusion
    variable = phi
    dop = u
    vac = v
  [../]
  [./dopant_kernel]
    type = Dopant
    variable = u
    vac = v
    phi = phi
    lambd = 1.3129e9 #-1.599515251458632e9 # fixed Lagrange multiplier value
    pps_name = pp
  [../]
  [./vacancy_kernel]
    type = Vacancy
    variable = v
    dop = u
    phi = phi
    lambv = 3.4112e9 #1.393471200379236e9 # fixed Lagrange multiplier value
    pps_name = pp2
  [../]

  [./sk_lm]
    type = ScalarLagrangeMultiplier
    variable = u
    lambda = lambda
  [../]

[]


[ScalarKernels]
active = ''

  [./constraint]
    type = PostprocessorCED
    variable = lambda
    pp_name = pp
    value = 0
  [../]
[]



[AuxKernels]
  [./lagrange_ex]
    type = ExampleAux
    variable = lagrange_test
    value = -0.05
    coupled = u
  [../]
[]

[BCs]
active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi'

  [./Neumann_inlet_u]
    type = NeumannBC
    variable = u
    boundary = left
    value = 0
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = u
    boundary = right
    value = 0
  [../]

  [./inlet_u]
    type = DiffusionBC
    variable = u
    boundary = left
    gradient_coefficient = 8e-9
  [../]
  [./outlet_u]
    type = DiffusionBC
    variable = u
    boundary = right
    gradient_coefficient = 8e-9 
  [../]

  [./Neumann_inlet_v]
    type = NeumannBC
    variable = v
    boundary = left
    value = 4.2746 # e9 using the larger and negative value for this BC leads to solver failure?
  [../]
  [./Neumann_outlet_v]
    type = NeumannBC
    variable = v
    boundary = right
    value = 0
  [../]
  [./inlet_v]
    type = DiffusionBC
    variable = v
    boundary = left
    gradient_coefficient = 1e-9 
  [../]
  [./outlet_v]
    type = DiffusionBC
    variable = v
    boundary = right
    gradient_coefficient = 1e-9
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC
    variable = phi
    boundary = left
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = DirichletBC
    variable = phi
    boundary = right
    value = 0
  [../]
  [./inlet_phi]
    type = DiffusionBC
    variable = phi
    boundary = left
    gradient_coefficient =  3.0875e-10
  [../]
  [./outlet_phi]
    type = DiffusionBC
    variable = phi
    boundary = right
    gradient_coefficient =  3.0875e-10
  [../]

[]

[Bounds]
  [./u_bounds]
    type = BoundsAux
    variable = bounds_dummy
    bounded_variable = u
    upper = 0.99
    lower = 0.01
  [../]
  [./v_bound]
    type = BoundsAux
    variable = bounds_dummy
    bounded_variable = v
    upper = 0.99
    lower = 0.01
  [../]
[]


[Postprocessors]
  [./pp]
    type = ElementIntegralVariablePostprocessor2
    variable = u
    var = 0.1
    execute_on = linear
  [../]

  [./pp2]
    type = ElementIntegralVariablePostprocessor2
    variable = v
    var = 0.05
    execute_on = linear
  [../]

[]


#[Postprocessors]
#  [./average_concentration]
#    type = ElementAverageValue
#    variable = u
#  [../]
#[]

[VectorPostprocessors]
  [./line]
    type = LineValueSampler
    start_point = '0 0 0'
    end_point = '5e-9 0 0'
    num_points = 125
    variable = 'u v phi'
    sort_by = 'id'
  [../]
[]


[Executioner]
  type = Steady

  solve_type = NEWTON
  nl_max_its = 30
  l_max_its = 100
  petsc_options_iname = '-pc_type -snes_type'
  petsc_options_value = 'lu vinewtonrsls'

  petsc_options = '-ksp_converged_reason -snes_converged_reason'

#  solve_type = PJFNK
#  nl_max_its = 30
#  l_max_its = 1000
#  petsc_options_iname = '-pc_type -pc_hypre_type'
#  petsc_options_value = 'hypre boomeramg'

[]

[Preconditioning]
  [./SMP]
    type = FDP
    full = true
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]

[Adaptivity]
  marker = errorfrac
  steps = 1
  [./Indicators]
    [./error]
    type = GradientJumpIndicator
    variable = phi
    [../]
  [../]
  [./Markers]
    [./errorfrac]
    type = ErrorFractionMarker
    refine = 0.25
    coarsen = 0.1
    indicator = error
    [../]
  [../]
[]

[Outputs]
#  file_base = out_test
#  console = true
#  exodus = true
#  csv = true
#  [./outtest]
#    type = Exodus
#  [../]

  execute_on = 'nonlinear'
#  [./csv]
#    type = csv
#    execute_on = 'initial nonlinear final'
#  [../]
  [./exodus]
    type = Exodus
    execute_on = 'initial nonlinear final'
  [../]

[]
