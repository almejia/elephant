## Input file for ElePhaNT MOOSE app  

[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10 # Number of elements in X-direction 
  ny = 25
  xmax = 5e-7 # Cell length [m] = 5 [mm]
  ymax = 2.00025e-7 # Cell height [m] = 2.0002 [mm] (2mm YSZ + 200nm CeO2)  

#  xmax = 5e-6 # Half grain size [m] = 500 [nm]
#  ymax = 5e-7 # 2D y-size for viewing mesh refinement
  bias_x = 1.0 # bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 0.5  # 1.80
[]

[MeshModifiers]
  [./subdomain_id]
    type = AssignElementSubdomainID
      subdomain_ids = '1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1
                       1 1 1 1 1 1 1 1 1 1

                       2 2 2 0 0 0 0 0 0 0
                       2 2 2 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0

                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       0 0 0 0 0 0 0 0 0 0
                       3 3 3 3 3 3 3 3 3 3'

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
    master_block = '0 1 2'
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
#active = 'q v phi muq muv theta'
  [./q]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = '0 3'
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.05
    scaling = 1
    block = '0 3'
  [../]
  [./phi]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = '0 3'
  [../]
  
  [./muq]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = '0 3'
  [../]
  [./muv]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = '0 3'
  [../]

  [./phi_ysz]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 1
  [../]

  [./theta]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 3
  [../]

[]

[Kernels]
#active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy'
  [./phi_kernel]
    type = EPotential
    variable = phi
    ele = q
    vac = v
    block = '0 3'
  [../]
  [./electron_kernel]
    type = Electron
    variable = q
    vac = v
    phi = phi
    mu = muq
    lambd = 0 # -1.599515251458632e9 # fixed Lagrange multiplier value
    block = '0 3'
  [../]
  [./vacancy_kernel]
    type = NewVacancy
    variable = v
    ele = q
    phi = phi
    mu = muv
    lambv = 0 # 1.393471200379236e9 # fixed Lagrange multiplier value
    block = '0 3'
  [../]

  [./mu_electron]
    type = SplitPCRes
    variable = muq
    con = q
    block = '0 3'
  [../]
  [./mu_vacancy]
    type = SplitPCRes
    variable = muv
    con = v
    block = '0 3'
  [../]

  [./phi_ysz]
    type = Diffusion
    variable = phi_ysz
    block = 1
  [../]

  [./theta_surface]
    type = SurfacePCRes
    variable = theta
    ele = q
    vac = v
    Ns = 1
    M = 1
    Pco = 1
    Pco2 = 1
    eta1 = 1
    eta2 = 1
    dHdd1 = 1
    dHdd2 = 1
    dS1 = 1
    dS2 = 1
    dH1 = 1
    dH2 = 1
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

[InterfaceKernels]
  [./interface]
    type = PenaltyInterfaceDiffusion
    variable = muv
    neighbor_var = phi_ysz
    boundary = ceo2_ysz
    penalty = 1
  [../]
[]
		       
[BCs]
#active = 'Neumann_inlet_u Neumann_outlet_u Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi'

  [./Neumann_inlet_u]
    type = NeumannBC
    variable = q
    boundary = bottom
    value = 2.5
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = q
    boundary = ceo2_ysz # top
    value = 0
  [../]

  [./Neumann_inlet_v]
    type = NeumannBC
    variable = v
    boundary = bottom
    value = 4.2746 # e9 using the larger and negative value for this BC leads to solver failure?
  [../]
  [./Neumann_outlet_v]
    type = NeumannBC
    variable = v
    boundary = ceo2_ysz # top
    value = 0
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC
    variable = phi
    boundary = bottom
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC # DirichletBC
    variable = phi
    boundary = ceo2_ysz # top
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
    boundary = top
    value = 1
  [../]

  [./ysz_au]
    type = NeumannBC
    variable = phi_ysz
    boundary = ysz_au
    value = 0
  [../]

  [./muq_surface]
    type = NeumannBC
    variable = muq
    boundary = bottom
    value = 1
  [../]

  [./muv_surface]
    type = NeumannBC
    variable = muv
    boundary = bottom
    value = 1
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
    start_point = '2.5e-6 0 0'
    end_point = '2.5e-6 5e-7 0'
    num_points = 125
    variable = 'q v phi muq muv'
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
  nl_max_its = 40
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  l_tol = 1.0e-5
  nl_rel_tol = 1.0e-5
  nl_abs_tol = 1.0e-5
		       
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
  steps = 2
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
