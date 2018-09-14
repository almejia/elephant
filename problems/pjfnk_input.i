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
[]

[Kernels]
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
    lambd = -1.599515251458632e9 # fixed Lagrange multiplier value
  [../]
  [./vacancy_kernel]
    type = Vacancy
    variable = v
    dop = u
    phi = phi
    lambv = 1.393471200379236e9 # fixed Lagrange multiplier value
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

[Postprocessors]
  [./average_concentration]
    type = ElementAverageValue
    variable = u
  [../]
[]

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

#  solve_type = NEWTON
  nl_max_its = 30
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  petsc_options = '-ksp_converged_reason -snes_converged_reason'

  solve_type = PJFNK
#  nl_max_its = 30
#  l_max_its = 1000
#  petsc_options_iname = '-pc_type -pc_hypre_type'
#  petsc_options_value = 'hypre boomeramg'

[]

[Preconditioning]
  [./SMP]
    type = SMP
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
