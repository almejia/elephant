## Input file for ElePhaNT MOOSE app

[Mesh]
  type = GeneratedMesh
    dim = 2
    nx = 20                # 1D: Number of elements in X-direction 
    ny = 70                # 2D: Number of elements in Y-direction
    xmax = 6e-5            # Cell base length [m] = 6 [mm]
    ymax = 5e-6            # 2D cell height [m] = 0.2 [mm]
    bias_x = 1.0           # X-bias 0.5 - 2.0 (left - right element-size refinement)
    bias_y = 0.80          # Y-bias 0.5 - 2.0 (top - bottom element-size refinement)
[]

[GlobalParams]
  V = 0.001          # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT
      
  Z = 1
      
  Dop = 0.1          # FIXED GADOLINIA DOPANT CONCENTRATION
  ny = 4.1488e4      # CATION-ELECTRON SITE DENSITY
  nyy = 1.6595e5     # CATION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nyv = 3.3190e5     # ANION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nv = 8.2975e4      # ANION SITE DENSITY 
  nvv = 2.4893e5     # ANION-ANION NEXT-NEAREST-NEIGHBOR DENSITY
 
  fy = 76100         # ELECTRON SELF INTERACTION ENERGY
  fqv = -16600       # ELECTRON-VACANCY INTERACTION ENERGY
  fqy = 5000         # ELECTRON-DOPANT INTERACTION ENERGY
  fyv = -40000       # VACANCY-DOPANT INTERACTION ENERGY
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

      
[MeshModifiers]
  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 2 2 2 2 2
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 2 2 2 2 2
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0

    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0

    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0

    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0

    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0

    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0

    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0
    3 3 3 3 3 4 4 4 4 4 4 4 0 0 0 0 0 0 0 0'
  [../]

  [./side_set1]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1 2'
    paired_block = '2'
    new_boundary = 'Au_interface'
  [../]
  [./side_set2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1 2'
    paired_block = '3'
    new_boundary = 'YSZ_Pt_surface'
  [../]
  [./side_set3]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1 2'
    paired_block = '4'
    new_boundary = 'YSZ_gas_surface'
  [../]

  [./delete_subdomain1]
    type = BlockDeleter
    depends_on = side_set1
    block_id = 2
  [../]
  [./delete_subdomain2]
    type = BlockDeleter
    depends_on = side_set2
    block_id = 3
  [../]
  [./delete_subdomain3]
    type = BlockDeleter
    depends_on = side_set3
    block_id = 4
  [../]

  [./break_boundary]
    type = BreakBoundaryOnSubdomain
    depends_on = subdomain_id
  [../]
  [./CeO2_YSZ]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 0
    paired_block = 1
    new_boundary = 'ceo2_ysz'
  [../]
  [./Au_CeO2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 0
    paired_block = 2
    new_boundary = 'ceo2_au'
  [../]
  [./Au_YSZ]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 1
    paired_block = 2
    new_boundary = 'ysz_au'
  [../]

[]


      
[Variables]
  active = 'u v phi phi_ysz'

    [./u]
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

    [./phi_ysz]
      order = FIRST
      family = LAGRANGE
      initial_condition = 0.0
      scaling = 1
      block = 1
    [../]

			     
    [./lambda]
      family = SCALAR
      order = FIRST
    [../]

  []

 # [AuxVariables]
 #   [./lagrange_test]
 #     order = FIRST
 #     family = LAGRANGE
 #   [../]

 #   [./bounds_dummy]
 #     order = FIRST
 #     family = LAGRANGE
 #   [../]
 # []

  [Kernels]
  active = 'phi_kernel dopant_kernel vacancy_kernel phi_ysz'

    [./phi_kernel]
      type = EDiffusion
      variable = phi
      dop = u
      vac = v
      block = 0
    [../]
    [./dopant_kernel]
      type = Dopant
      variable = u
      vac = v
      phi = phi
      lambd = -1.599515251458632e9 #1.3129e9 #-1.599515251458632e9 # fixed Lagrange multiplier value
      pps_name = pp
      block = 0
    [../]
    [./vacancy_kernel]
      type = Vacancy
      variable = v
      dop = u
      phi = phi
      lambv = 1.393471200379236e9 #3.4112e9 #1.393471200379236e9 # fixed Lagrange multiplier value
      pps_name = pp2
      block = 0
    [../]
    [./phi_ysz]
      type = Diffusion
      variable = phi_ysz
      block = 1
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
 #   [./lagrange_ex]
 #     type = ExampleAux
 #     variable = lagrange_test
 #     value = -0.05
 #     coupled = u
 #   [../]
  []

  [BCs]
  active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi ysz_au ysz_pt ceo2_ysz'

    [./Neumann_inlet_u]
      type = NeumannBC
      variable = u
      boundary = top_to_0
      value = 2.5
    [../]
    [./Neumann_outlet_u]
      type = NeumannBC
      variable = u
      boundary = 'ceo2_ysz ceo2_au'
      value = 0
    [../]

    [./Neumann_inlet_v]
      type = NeumannBC
      variable = v
      boundary = top_to_0
      value = 4.2746 
    [../]
    [./Neumann_outlet_v]
      type = NeumannBC
      variable = v
      boundary = 'ceo2_ysz ceo2_au'
      value = 0
    [../]

    [./Neumann_inlet_phi]
      type = NeumannBC
      variable = phi
      boundary = top_to_0
      value = 0
    [../]
    [./Neumann_outlet_phi]
      type = NeumannBC
      variable = phi
      boundary = 'ceo2_ysz ceo2_au'
      value = 0
    [../]

    [./ceo2_ysz]
      type = MatchedValueBC
      variable = phi_ysz
      v = phi
      boundary = ceo2_ysz
    [../]
			     
    [./ysz_au]
      type = NeumannBC
      variable = phi_ysz
      boundary = ysz_au
      value = 0
    [../]
    [./ysz_pt]
      type = DirichletBC
      variable = phi_ysz
      boundary = YSZ_Pt_surface
      value = 0
    [../]

  []

#  [Bounds]
#    [./u_bounds]
#      type = BoundsAux
#      variable = bounds_dummy
#      bounded_variable = u
#      upper = 0.99
#      lower = 0.01
#      block = 0
#    [../]
#    [./v_bound]
#      type = BoundsAux
#      variable = bounds_dummy
#      bounded_variable = v
#      upper = 0.99
#      lower = 0.01
#      block = 0
#    [../]
#  []


  [Postprocessors]
    [./pp]
      type = ElementIntegralVariablePostprocessor2
      variable = u
      var = 0.1
      execute_on = linear
      block = 0
    [../]

    [./pp2]
      type = ElementIntegralVariablePostprocessor2
      variable = v
      var = 0.05
      execute_on = linear
      block = 0
    [../]

  []


  #[Postprocessors]
  #  [./average_concentration]
  #    type = ElementAverageValue
  #    variable = u
  #  [../]
  #[]

[VectorPostprocessors]
  [./line_x]
    type = LineValueSampler
    start_point = '4.47e-5 5e-6 0'
    end_point = '4.51e-5 5e-6 0'
    num_points = 256
    variable = 'u v phi'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '5e-5 5e-6 0'
    end_point = '5e-5 4.995e-6 0'
    num_points = 256
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
