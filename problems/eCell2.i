## Input file for ElePhaNT MOOSE app  

[GlobalParams]
  V = 0.001          # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT

  Z = 2
  
  Dop = 0.0          # FIXED GADOLINIA DOPANT CONCENTRATION
  ny = 4.1488e4      # CATION-ELECTRON SITE DENSITY
  nyy = 1.6595e5     # CATION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nyv = 3.3190e5     # ANION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nv = 8.2975e4      # ANION SITE DENSITY 
  nvv = 2.4893e5     # ANION-ANION NEXT-NEAREST-NEIGHBOR DENSITY
 
  fy = 76100         # ELECTRON SELF INTERACTION ENERGY
  fyv = -16600       # ELECTRON-VACANCY INTERACTION ENERGY
  fqy = 5000         # ELECTRON-DOPANT INTERACTION ENERGY
#  fyv = -40000       # VACANCY-DOPANT INTERACTION ENERGY
  fv = 57400         # VACANCY SELF INTERACTION ENERGY

  cd = 1.18e-9       # ELECTRON GRADIENT ENERGY COEFFICIENT
  cv = 1.07e-9       # VACANCY GRADIENT ENERGY COEFFICIENT
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
  nx = 50 # Number of elements in X-direction 
  ny = 40
  xmax = 4e-7 # Half grain size [m] = 400 [nm]
  ymax = 5e-4 # 2D y-size for viewing mesh refinement
  ymin = -5e-4
  bias_x = 1.2 # bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 1.0
[]

[MeshModifiers]
  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1

 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 1 1 1 1 1'
  [../]
  [./side_set]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1'
    paired_block = '1'
    new_boundary = 'au_cc'
  [../]
  [./delete_subdomain1]
    type = BlockDeleter
    depends_on = side_set
    block_id = 1
  [../]

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
  [./muq]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0
    scaling = 1
  [../]
  [./muv]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0
    scaling = 1
  [../]
  [./theta]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
  [../]


[]

[Kernels]
active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy theta'
  [./phi_kernel]
    type = EPotential2D
    variable = phi
    ele = u
    vac = v
  [../]
  [./phi_kernel2]
    type = EDiffusion
    variable = phi
    dop = u
    vac = v
  [../]
  [./electron_kernel]
    type = Electron
    variable = u
    vac = v
    phi = phi
    mu = muq
    lambd = 0 #-1.599515251458632e9 # fixed Lagrange multiplier value
  [../]
  [./vacancy_kernel]
    type = NewVacancy
    variable = v
    ele = u
    phi = phi
    mu = muv
    lambv = 0 #1.393471200379236e9 # fixed Lagrange multiplier value
  [../]

  [./muq]
    type = Diffusion
    variable = muq
  [../]
  [./muv]
    type = Diffusion
    variable = muv
  [../]

  [./mu_electron]
    type = ChemPotential2D   
    variable = muq        
    con = u               
    Ns = 4.1488e4       
    M = 3.15e-10        
    #block = 1
  [../]
  [./mu_vacancy] 
    type = ChemPotential2D
    variable = muv
    con = v
    Ns = 8.2975e4
    M =  1.0425e-12
    #block = 1
  [../]

  
  [./theta]
    type = SurfacePC
    variable = theta
    Ns = 1.3e-5
    Mob = 1e-4
  [../]

  [./u_dot]
    type = TimeDerivative
    variable = u
  [../]
  [./v_dot]
    type = TimeDerivative
    variable = v
  [../]
[]

[BCs]
active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi surface N_inlet_muq N_inlet_muv muq_ce_au muv_ce_au'

  [./Neumann_inlet_u]
    type = NeumannBC
    variable = u
    boundary = left
    value = 2.6
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = u
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
    type = NeumannBC
    variable = phi
    boundary = right
    value = 0
  [../]

  [./surface]
    type = CSurface
    variable = theta
    boundary = left
    ele = u
    vac = v
  [../]

  [./N_inlet_muq]
    type = CoupledFluxBC  #DirichletBC #NeumannBC#
    variable = muq
    boundary = left 
    #value = -1e4  # -1e-4 #1e-14
    alpha = 2
    the = theta
    ele = u
    vac = v
    Ns = 4.1488e4
    M = 3.15e-10
  [../]
  [./N_inlet_muv]
    type = CoupledFluxBC #NeumannBC#DirichletBC #NeumannBC#
    variable = muv
    boundary = left
    #value = -1e4  # -1e-6# 1e-14
    alpha = 1
    the = theta
    ele = u
    vac = v
    Ns = 8.2975e4
    M =  1.0425e-12
  [../]
  [./muq_ce_au]
    type = DirichletBC
    variable = muq
    boundary = au_cc
#    function = au_bc
    value = 96485e-2    
  [../]
  [./muv_ce_au]
    type = DirichletBC
    variable = muv
    boundary = right
    value = 8e5 #2e5
  [../]
  [./muv_ysz]
    type = NeumannBC
    variable = muv
    boundary = right
    value = 2
  [../]

[]

[Postprocessors]
  [./average_concentration]
    type = ElementAverageValue
    variable = u
  [../]
[]

[VectorPostprocessors]
  [./line_x]
    type = LineValueSampler
    start_point = '0 0 0'
    end_point = '4e-7 0 0'
    num_points = 256
    variable = 'u v phi muq muv theta'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '0 -10e-6 0'
    end_point = '0 20e-6 0'
    num_points = 256
    variable = 'u v phi muq muv theta'
    sort_by = 'id'
  [../]
[]


[Executioner]
#  type = Transient
#  solve_type = NEWTON
#  l_max_its = 30
#  l_tol = 1e-6
#  nl_max_its = 100
  nl_abs_tol = 1e-9
#  end_time = 1800
#  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_ksp_type -sub_pc_type -pc_asm_overlap'
#  petsc_options_value = 'asm  31  preonly  ilu  1'

  
  type = Steady

  solve_type = NEWTON
  nl_max_its = 100
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  petsc_options = '-ksp_converged_reason -snes_converged_reason'

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
  steps = 1
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
