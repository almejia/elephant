## Input file for ElePhaNT MOOSE app  

[GlobalParams]
  V = 0.001          # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT
  
  Dop = 0.1          # FIXED GADOLINIA DOPANT CONCENTRATION
  nq = 4.1488e4      # CATION-ELECTRON SITE DENSITY
  nqq = 1.6595e5     # CATION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nqv = 3.3190e5     # ANION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nv = 8.2975e4      # ANION SITE DENSITY 
  nvv = 2.4893e5     # ANION-ANION NEXT-NEAREST-NEIGHBOR DENSITY
 
  fq = 76100         # ELECTRON SELF INTERACTION ENERGY
  fqv = -16600       # ELECTRON-VACANCY INTERACTION ENERGY
  fqy = 5000         # ELECTRON-DOPANT INTERACTION ENERGY
  fyv = -40000       # VACANCY-DOPANT INTERACTION ENERGY
  fv = 57400         # VACANCY SELF INTERACTION ENERGY

  gq = 1.18e-9       # ELECTRON GRADIENT ENERGY COEFFICIENT
  gv = 1.07e-9       # VACANCY GRADIENT ENERGY COEFFICIENT
  F = 96485          # ENERGY (Faraday) CONSTANT [J/mol]

  Pco = 0.004        # CO PARTIAL PRESSURE [atm] (0.04)
  Pco2 = 0.2         # CO2 PARTIAL PRESSURE [atm]
  
  eta1 = 1e3         # Pre-EXPONTENTIAL FACTOR: zeta_ads (max 1e-6 -> converging)
  eta2 = 1e2         # Pre-EXPONTENTIAL FACTOR: zeta_inc (max 1e8)
  dHdd1 = 3.0e4      # ADS-1 ENTHALPY DoubleDagger [J] = [Kg.m2/s2] (4e5)
  dHdd2 = 1.0e4      # INC-2 ENTHALPY DoubleDagger [J] (1e5)
  dS1 = 0            # ADS REACTION ENTROPY [J/K] = [Kg.m2/s2.K]
  dS2 = 0            # INC REACTION ENTROPY [J/K]
  dH1 = 1.0e4        # ADS REACTION ENTHALPY [J] (3e5)
  dH2 = 1.5e4        # INC REACTION ENTHALPY [J] (1.5e5)
[]


[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 8 # Number of elements in X-direction 
  ny = 30
  xmax = 5e-6 # Half grain size [m] = 500 [nm]
  ymax = 5e-7 # 2D y-size for viewing mesh refinement
  bias_x = 1.0 # bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 0.7
[]

[MeshModifiers]
  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '
 0 0 0 0 0 2 2 2
 0 0 0 0 0 2 2 2
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0

 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0

 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0'

#                    '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#                     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#                     2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#                     2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1'

  [../]

  [./side_set]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 2'
    paired_block = '2'
    new_boundary = 'new'
  [../]
  [./delete_subdomain]
    type = BlockDeleter
    depends_on = side_set
    block_id = 2
  [../]
  [./break_boundary]
    type = BreakBoundaryOnSubdomain
    depends_on = subdomain_id
  [../]
#  [./CeO2_YSZ]
#    type = SideSetsBetweenSubdomains
#    depends_on = subdomain_id
#    master_block = 0
#    paired_block = 1
#    new_boundary = 'ceo2_ysz'
#  [../]
  [./Au_CeO2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 0
    paired_block = 2
    new_boundary = 'ceo2_au'
  [../]
#  [./Au_YSZ]
#    type = SideSetsBetweenSubdomains
#    depends_on = subdomain_id
#    master_block = 1
#    paired_block = 2
#    new_boundary = 'ysz_au'
#  [../]

[]
  
[Variables]
active = 'q v phi'
  [./q]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = 0
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.05
    scaling = 1
    block = 0
  [../]
  [./phi]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 0
  [../]

  [./theta]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.05
    scaling = 1
    block = 0
  [../]
		       
  [./muq]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 0
  [../]
  [./muv]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 0
  [../]

    [./phi_ysz]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 1
  [../]

[]

[Kernels]
active = 'phi_kernel electron_kernel vacancy_kernel'
  [./phi_kernel]
    type = EPotential
    variable = phi
    ele = q
    vac = v
    block = 0
  [../]
  [./electron_kernel]
    type = ElectronEq
    variable = q
    vac = v
    phi = phi
#    mu = muq
    lambd = -1.599515251458632e9 # fixed Lagrange multiplier value
    block = 0
  [../]
  [./vacancy_kernel]
    type = VacancyEq
    variable = v
    ele = q
    phi = phi
#    mu = muv
    lambv = 1.393471200379236e9 # fixed Lagrange multiplier value
    block = 0
  [../]

  [./mu_electron]
    type = SplitPCRes
    variable = muq
    con = q
    block = 0
  [../]
  [./mu_vacancy]
    type = SplitPCRes
    variable = muv
    con = v
    block = 0
  [../]

  [./phi_ysz]
    type = Diffusion
    variable = phi_ysz
    block = 1
  [../]

  [./theta]
    type = SurfacePC
    variable = theta
    Ns = 1.3e-5
    Mob = 1e-4
    block = 0
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

#[InterfaceKernels]
#  [./interface]
#    type = PenaltyInterfaceDiffusion
#    variable = muv
#    neighbor_var = phi_ysz
#    boundary = ceo2_ysz
#    penalty = 1
#  [../]
#[]
		       
[BCs]
active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi'

  [./Neumann_inlet_u]
    type = NeumannBC
    variable = q
    boundary = top
    value = 2.5
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = q
    boundary = bottom
    value = 0
  [../]

  [./Neumann_inlet_v]
    type = NeumannBC
    variable = v
    boundary = top
    value = 4.2746 # e9 using the larger and negative value for this BC leads to solver failure?
  [../]
  [./Neumann_outlet_v]
    type = NeumannBC
    variable = v
    boundary = bottom
    value = 0
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC
    variable = phi
    boundary = top
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC # DirichletBC
    variable = phi
    boundary = bottom
    value = 0
  [../]

  [./muq_ce_au]
    type = DirichletBC
    variable = muq
    boundary = ceo2_au
    value = 1.5
  [../]

  [./phi_ysz_ce]
    type = DirichletBC
    variable = phi_ysz
    boundary = bottom
    value = 1
  [../]

  [./ysz_au]
    type = NeumannBC
    variable = phi_ysz
    boundary = ysz_au
    value = 0
  [../]

  [./interface]
    type = MatchedValueBC
    variable = muv
    boundary = ceo2_ysz
    v = phi_ysz
  [../]

  [./surface]
    type = CSurface
    variable = theta
    boundary = top
    ele = q
    vac = v
  [../]

[]

[Postprocessors]
active = ''
  [./average_concentration]
    type = ElementAverageValue
    variable = q
  [../]
[]

[VectorPostprocessors]
  [./line]
    type = LineValueSampler
    start_point = '0 5e-7 0'
    end_point = '0 4.95e-7 0'
    num_points = 256
    variable = 'q v phi theta'
    sort_by = 'id'
  [../]
[]


[Executioner]
#  type = Transient
#  solve_type = NEWTON
#  l_max_its = 30
#  l_tol = 1e-6
#  nl_max_its = 50
#  nl_abs_tol = 1e-9
#  end_time = 1800
#  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_ksp_type -sub_pc_type -pc_asm_overlap'
#  petsc_options_value = 'asm  31  preonly  ilu  1'

  
  type = Steady

  solve_type = NEWTON
  nl_max_its = 30
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  l_tol = 1.0e-10
  nl_rel_tol = 1.0e-10
  nl_abs_tol = 1.0e-10
		       
#  petsc_options = '-ksp_converged_reason -snes_converged_reason'

#  solve_type = PJFNK
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
  steps = 4
  [./Indicators]
    [./error]
    type = GradientJumpIndicator
    variable = v
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
