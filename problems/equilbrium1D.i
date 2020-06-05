# Equilibrium 1D Model

## Input file ElePhaNT MOOSE app

[Mesh]
  type = GeneratedMesh
  dim = 2                # Mesh dimensions: 1D, 2D, 3D
  nx = 100               # 1D: Number of elements in X-direction 
  ny = 1                 # 2D: Number of elements in Y-direction
  nz = 1                 # 3D: Number of elements in Z-direction
  xmax = 200e-9          # Cell base length [m] = 200 [nm]
  ymax = 20e-9           # 2D cell height [m] = 20 [nm]
  zmax = 20e-9           # 3D cell width [m] = 20 [nm]
  bias_x = 0.9           # X-bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 1             # Y-bias 0.5 - 2.0 (top - bottom element-size refinement)
[]

#################################################################################################################
#################################################################################################################

[GlobalParams]
  V = 0.01           # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT
  
  Dop = 0.1          # FIXED GADOLINIA DOPANT CONCENTRATION
  nq = 4.1488e4      # CATION (Electron) SITE DENSITY
  nqq = 1.6595e5     # CATION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nqv = 3.3190e5     # ANION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nv = 8.2975e4      # ANION SITE DENSITY 
  nvv = 2.4893e5     # ANION-ANION NEXT-NEAREST-NEIGHBOR DENSITY
 
  fq = 90000         # ELECTRON SELF INTERACTION ENERGY
  fqv = -7000        # ELECTRON-VACANCY INTERACTION ENERGY
  fv = 90000         # VACANCY SELF INTERACTION ENERGY

  gd = 8e-9          # ELECTRON GRADIENT ENERGY COEFFICIENT
  gv = 1e-9          # VACANCY GRADIENT ENERGY COEFFICIENT
  F = 96485          # ENERGY (Faraday) CONSTANT [J/mol]

  eta1 = 0           # Pre-EXPONTENTIAL FACTOR: zeta_ads
  eta2 = 0           # Pre-EXPONTENTIAL FACTOR: zeta_inc
  dHdd1 = 0          # ADS-1 ENTHALPY DoubleDagger [J] = [Kg.m2/s2]
  dHdd2 = 0          # INC-2 ENTHALPY DoubleDagger [J]
  dS1 = 0            # ADS REACTION ENTROPY [J/K] = [Kg.m2/s2.K]
  dS2 = 0            # INC REACTION ENTROPY [J/K]
  dH1 = 0            # ADS REACTION ENTHALPY [J]
  dH2 = 0            # INC REACTION ENTHALPY [J]  
[]

#################################################################################################################
#################################################################################################################
  
[MeshModifiers]

[]

#################################################################################################################
#################################################################################################################
  
[Variables]
active = 'q v phi muq muv'
  [./q]
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
  
  [./muq]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
  [../]
  [./muv]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
  [../]

  [./phi_ysz]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
  [../]

  [./theta]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
  [../]

[]

#################################################################################################################
#################################################################################################################
  
[Kernels]
active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy'
  [./phi_kernel]         # Kernel/Governing Eqn for ELECTROSTATIC POTENTIAL
    type = EPotential1D  # Name of physics kernel used
    variable = phi       # Main Variable that kernel is solving
    ele = q              # Coupled variable 1 = coupled electron concentration
    vac = v              # Coupled variable 2 = coupled vacancy concentration
  [../]
  [./electron_kernel]    # Governing Eqn for ELECTRON SITE FRACTION
    type = Electron1D
    variable = q
    vac = v
    phi = phi
    mu = muq
    lambd = 0            # Lagrange multiplier value
  [../]
  [./vacancy_kernel]     # Governing Eqn for VACANCY SITE FRACTION
    type = Vacancy1D
    variable = v
    ele = q
    phi = phi
    mu = muv
    lambv = 0            # Lagrange multiplier value
  [../]

  [./mu_electron]        # Governing Eqn for ELECTRON ELECTROCHEMICAL POTENTIAL
    type = SplitPCRes
    variable = muq
    con = q
  [../]
  [./mu_vacancy]         # Governing Eqn for VACANCY ELECTROCHEMICAL POTENTIAL
    type = SplitPCRes
    variable = muv
    con = v
  [../]

  [./phi_ysz]            # Governing Eqn for ELECTROLYTE ELECTROSATIC POTENTIAL = Laplace Eqn
    type = Diffusion
    variable = phi_ysz
  [../]

  [./surface]            # Governing Eqn for SURFACE CO2 REDUCTION REACTION 
    type = SurfacePCRes
    variable = theta
    ele = q
    vac = v
#    velocity = '1.0 1.0 0.0'
#    dHdd1 = 0
#    dHdd2 = 0
#    dS1 = 0
#    dS2 = 0
#    dH1 = 0
#    dH2 = 0
  [../]
  
		       
#  [./u_dot]
#    type = TimeDerivative
#    variable = u
#  [../]
#  [./v_dot]
#    type = TimeDerivative
#    variable = v
#  [../]
[]

#################################################################################################################
#################################################################################################################

#[Functions]
#  [./left_bc]
#    type = ParsedFunction
#    value = 96485*t
#  [../]
#[]

#################################################################################################################
#################################################################################################################
  
[BCs]
#active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi'

  [./Neumann_inlet_u]
    type = NeumannBC
    variable = q
    boundary = left
    value = 2.5
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = q
    boundary = right
    value = 0
  [../]

  [./Neumann_inlet_v]
    type = NeumannBC
    variable = v
    boundary = left
    value = 4.2746 
  [../]
  [./Neumann_outlet_v]
    type = NeumannBC
    variable = v
    boundary = right 
    value = 0
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC
    variable = phi
    boundary = left
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC # DirichletBC
    variable = phi
    boundary = right
    value = 0
  [../]

#  [./muq_ce_au]
#    type = CDirichletBC
#    variable = muq
#    boundary = ceo2_au
#    var1 = 0.01        # Applied VOLTAGE
#    var2 = 94685       # ENERGY COEFFICIENT
#  [../]

[]

#################################################################################################################
#################################################################################################################
  
[Postprocessors]
active = ''
  [./average_concentration]
    type = ElementAverageValue
    variable = q
  [../]
[]

#################################################################################################################
#################################################################################################################
  
[VectorPostprocessors]
  [./line_x]
    type = LineValueSampler
    start_point = '0 0 0'
    end_point = '200e-9 0 0'
    num_points = 100
    variable = 'q v phi muq muv'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '0 0 0'
    end_point = '0 20e-9 0'
    num_points = 10
    variable = 'q v phi muq muv'
    sort_by = 'id'
  [../]
[]

#################################################################################################################
#################################################################################################################

[Executioner]

#  type = Transient
#  dt = 0.1
#  solve_type = NEWTON
#  end_time = 1

  
  type = Steady

  solve_type = NEWTON
  nl_max_its = 30
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  l_tol = 1.0e-6
  nl_rel_tol = 1.0e-6
  nl_abs_tol = 1.0e-6
		       
  petsc_options = '-ksp_converged_reason -snes_converged_reason'
[]

#################################################################################################################
#################################################################################################################
  
[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Debug]
  show_var_residual_norms = true
[]

#################################################################################################################
#################################################################################################################
  
[Adaptivity]
  marker = errorfrac
  steps = 4
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

#################################################################################################################
#################################################################################################################
  
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
