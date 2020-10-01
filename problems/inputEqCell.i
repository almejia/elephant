## Input file for ElePhaNT MOOSE app  

[GlobalParams]
  V = 0.001          # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT
  F = 96485          # ENERGY (Faraday) CONSTANT [J/mol]
  
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

  lambv = 1e5
  lambd = 1e5
  
  Pco = 0.004        # CO PARTIAL PRESSURE [atm] (0.04)
  Pco2 = 0.2         # CO2 PARTIAL PRESSURE [atm]
  
  eta1 = 1e5         # Pre-EXPONTENTIAL FACTOR: zeta_ads (max 1e-6 -> converging)
  eta2 = 1e4         # Pre-EXPONTENTIAL FACTOR: zeta_inc (max 1e8)
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
  nx = 20 # Number of elements in X-direction 
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
 0 0 0 0 0 0 0 0 0 0  0 0 0 2 2 2 2 2 2 2
 0 0 0 0 0 0 0 0 0 0  0 0 0 2 2 2 2 2 2 2
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0'

# '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1'

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
active = 'q v phi theta muq muv'
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
active = 'phi_kernel electron_kernel vacancy_kernel theta mu_electron mu_vacancy'
  [./phi_kernel]
    type = EPotential
    variable = phi
    ele = q
    vac = v
    block = 0
  [../]
  [./electron_kernel]
    type = ElectronKin
    variable = q
    vac = v
    phi = phi
    muq = muq
#    lambd = 0
    block = 0
  [../]
  [./vacancy_kernel]
    type = VacancyKin
    variable = v
    ele = q
    phi = phi
    muv = muv
#    lambv = 1.393471200379236e9 
    block = 0
  [../]

  [./mu_electron]
    type = ChemPotential2D
    variable = muq
    con = q
    Ns = 4.1488e4
    M = 3.15e-10
    block = 0
  [../]
  [./mu_vacancy]
    type = ChemPotential2D
    variable = muv
    con = v
    Ns = 8.2975e4
    M = 1.0425e-12
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
active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi surface muq_surface muv_surface muq_ce_au muv_ysz'

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
    value = 4.2746
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
  [./muq_surface]
    type = NeumannBC
    variable = muq
    boundary = top
    value = -1.5
  [../]

  [./muv_surface]
    type = NeumannBC
    variable = muv
    boundary = top
    value = -3.0
  [../]
  [./muv_ysz]
    type = DirichletBC
    variable = muv
    boundary = bottom
    value = 8
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
  [./bulk]
    type = DirichletBC
    variable = theta
    boundary = 'bottom ceo2_au'
    value = 0
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
  [./surface_line]
    type = LineValueSampler
    start_point = '0 5e-7 0'
    end_point = '0 4.95e-7 0'
    num_points = 256
    variable = 'q v phi theta muq muv'
    sort_by = 'id'
  [../]
  [./interior_line]
    type = LineValueSampler
    start_point = '0 5e-7 0'
    end_point = '5e-6 5e-7 0'
    num_points = 256
    variable = 'q v phi theta muq muv'
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

#  solve_type = NEWTON
  nl_max_its = 50
  l_max_its = 200
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  l_tol = 1.0e-6
  nl_rel_tol = 1.0e-6
  nl_abs_tol = 1.0e-6
		       
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
  steps = 3
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
