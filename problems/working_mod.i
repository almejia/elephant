## Input file ElePhaNT MOOSE app  

[Mesh]
  type = GeneratedMesh
  dim = 3                # Mesh dimensions: 1D, 2D, 3D
  nx = 20                # 1D: Number of elements in X-direction 
  ny = 40                # 2D: Number of elements in Y-direction
  nz = 1                 # 3D: Number of elements in Z-direction
  xmax = 6e-3            # Cell base length [m] = 6 [mm]
  ymax = 0.2e-3          # 2D cell height [m] = 0.2 [mm]
  zmax = 2e-3            # 3D cell width [m] = 2.5 [mm]
  bias_x = 1.0           # X-bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 0.65          # Y-bias 0.5 - 2.0 (top - bottom element-size refinement)
[]

[GlobalParams]
  V = 0.01           # VOLTAGE [V]
  T = 773    # 1673  # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] = PV/nT
  
  Dop = 0.1          # FIXED GADOLINIA DOPANT CONCENTRATION
  ny = 4.1488e4      # CATION SITE DENSITY
  nyy = 1.6595e5     # CATION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nyv = 3.3190e5     # ANION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nv = 8.2975e4      # ANION SITE DENSITY 
  nvv = 2.4893e5     # ANION-ANION NEXT-NEAREST-NEIGHBOR DENSITY
 
  fy = 90000         # DOPANT SELF INTERACTION ENERGY
  fyv = -7000        # DOPANT-VACANCY INTERACTION ENERGY
  fv = 90000         # VACANCY SELF INTERACTION ENERGY

  cd = 8e-9          # DOPANT GRADIENT ENERGY COEFFICIENT
  cv = 1e-9          # VACANCY GRADIENT ENERGY COEFFICIENT
  F = 96485          # ENERGY CONSTANT
   
[]

[MeshModifiers]
  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
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
#active = 'q v phi muq muv'
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
#active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy'
  [./phi_kernel]
    type = EPotential
    variable = phi
    ele = q
    vac = v
    block = 0
  [../]
  [./electron_kernel]
    type = Electron
    variable = q
    vac = v
    phi = phi
    mu = muq
    lambd = 0
    block = 0
  [../]
  [./vacancy_kernel]
    type = NewVacancy
    variable = v
    ele = q
    phi = phi
    mu = muv
    lambv = 0
    block = 0
  [../]

  [./mu_electron]
    type = SplitPCRes
    variable = muq
    con = q
    Ns = 1.8e-5
    M = 1e-3
    block = 0
  [../]
  [./mu_vacancy]
    type = SplitPCRes
    variable = muv
    con = v
    Ns = 3.6e-5
    M = 1e-3
    block = 0
  [../]

  [./phi_ysz]
    type = Diffusion
    variable = phi_ysz
    block = 1
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
#active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi'

  [./Neumann_inlet_u]
    type = NeumannBC
    variable = q
    boundary = top_to_0
    value = 2.5
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = q
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
    type = NeumannBC # DirichletBC
    variable = phi
    boundary = 'ceo2_ysz ceo2_au'
    value = 0
  [../]

  [./muq_ce_au]
    type = CDirichletBC
    variable = muq
    boundary = ceo2_au
    var1 = 0.01    # Applied VOLTAGE
    var2 = 94685   # ENERGY COEFFICIENT
  [../]

  [./phi_ysz_ce]
    type = DirichletBC
    variable = phi_ysz
    boundary = bottom
    value = 0.01
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
  
  [./interface]
    type = CMatchedValueBC
    variable = muv
    boundary = ceo2_ysz
    v = phi_ysz
  [../]

  [./Neumann_inlet_muq]
    type = NeumannBC
    variable = muq
    boundary = top_to_0
    value = 2.5e2
  [../]
  [./Neumann_inlet_muv]
    type = NeumannBC
    variable = muv
    boundary = top_to_0
    value = 2.5e2
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
  [./line_x]
    type = LineValueSampler
    start_point = '4.47e-3 0.2e-3 0'
    end_point = '4.51e-3 0.2e-3 0'
    num_points = 256
    variable = 'q v phi muq muv'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '5e-3 200000e-9 0'
    end_point = '5e-3 199995e-9 0'
    num_points = 256
    variable = 'q v phi muq muv'
    sort_by = 'id'
  [../]
[]


[Executioner]
  type = Steady

  solve_type = NEWTON
  nl_max_its = 30
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  l_tol = 1.0e-6
  nl_rel_tol = 1.0e-3
  nl_abs_tol = 1.0e-3
		       
#  petsc_options = '-ksp_converged_reason -snes_converged_reason'
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
  csv = true
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
