## Input file for ElePhaNT MOOSE app  

[Mesh]
  type = GeneratedMesh
  dim = 2

  nx = 50          # Number of elements in X-direction 
  ny = 50
  xmax = 6.5e-3    # Cell length [m] = 6.5 [mm]
  ymax = 10000e-9  # Cell height [m] = 10 [um] 
  bias_x = 0.97     # bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 0.85
[]

[GlobalParams]
  V = 0.01           # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT
  
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

  eta1 = 1e13 #0            # Pre-EXPONTENTIAL FACTOR: zeta_ads
  eta2 = 1e10 #0            # Pre-EXPONTENTIAL FACTOR: zeta_inc
  dHdd1 = 2.4121e4 #0       # ADS-1 ENTHALPY DoubleDagger [J] = [Kg.m2/s2]
  dHdd2 = 2.4121e4 #0       # INC-2 ENTHALPY DoubleDagger [J]
  dS1 = -84.9 #0            # ADS REACTION ENTROPY [J/K] = [Kg.m2/s2.K]
  dS2 = -84.9 #0            # INC REACTION ENTROPY [J/K]
  dH1 = -2.1709e5 #0        # ADS REACTION ENTHALPY [J]
  dH2 = -2.1709e5 #0        # INC REACTION ENTHALPY [J]  
[]
  
[MeshModifiers]
  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1
                     1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1

                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5

                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
                     3 3 3 3 3 3 3 3 4 4  4 4 4 4 4 4 4 4 4 4  4 4 2 2 2 2 2 2 2 2  2 2 2 2 2 2 2 2 2 2  2 2 2 2 2 2 2 2 2 2'

  [../]
  [./ceo2_cc]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 0
    paired_block = 5
    new_boundary = 'ceo2_au'
  [../]
  [./ysz_cc]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 1
    paired_block = 5
    new_boundary = 'ysz_au'
  [../]
  [./surface]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 0
    paired_block = 2
    new_boundary = 'ceo2_surface'
  [../]
  [./ceo2_ysz]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0'
    paired_block = '1'
    new_boundary = 'ceo2_ysz'
  [../]
  [./ysz_ce]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 1
    paired_block = 3
    new_boundary = 'ysz_pt'
  [../]
  [./ysz_gas]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 1
    paired_block = 4
    new_boundary = 'ysz_gas'
  [../]

  [./delete_subdomain1]
    type = BlockDeleter
    depends_on = ceo2_cc
    block_id = 5
  [../]
  [./delete_subdomain2]
    type = BlockDeleter
    depends_on = ysz_ce
    block_id = 3
  [../]
  [./delete_subdomain3]
    type = BlockDeleter
    depends_on = ysz_gas
    block_id = 4
  [../]
[]
  
[Variables]
  active = 'u v phi muq muv phi_ysz theta'
  [./u]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = '0 2'
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.05
    scaling = 1
    block = '0 2'
  [../]
  [./phi]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = '0 2'
  [../]
  [./muq]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.2
    scaling = 1
    block = '0 2'
  [../]
  [./muv]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = '0 2'
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
    block = 2
  [../]

[]

  
[Kernels]
active = 'phi_2 electron_2 vacancy_2 mu_e mu_v phi_ysz surface'  

  [./phi_2]     
    type = EPotential  
    variable = phi     
    ele = u            
    vac = v
    block = '0 2'
  [../]
  [./electron_2]    # Governing Eqn for ELECTRON CONCENTRATION
    type = Electron
    variable = u
    vac = v
    phi = phi
    mu = muq
    lambd = 0
    block = '0 2'
  [../]
  [./vacancy_2]     # Governing Eqn for VACANCY CONCENTRATION
    type = NewVacancy
    variable = v
    ele = u
    phi = phi
    mu = muv
    lambv = 0            # Lagrange multiplier value
    block = '0 2'
  [../]

  [./mu_e]   # Governing Eqn for ELECTRON CHEMICAL POTENTIAL
    type = ChemPotential
    variable = muq
    con = u
    Ns = 41487.74 #1.3006e-5
    M = 3.15e-10
    block = '0 2'
  [../]
  [./mu_v]   # Governing Eqn for VACANCY CHEMICAL POTENTIAL
    type = ChemPotential
    variable = muv
    con = v
    Ns = 82975.47 #2.6012e-5
    M = 1.0425e-12
    block = '0 2'
  [../]

  [./time_e]
    type = CoupledTimeDerivative
    variable = muq
    v = u
  [../]
  [./time_v]
    type = CoupledTimeDerivative
    variable = muv
    v = v
  [../]

  [./phi_ysz]
    type = Diffusion
    variable = phi_ysz
    block = 1
  [../]


  [./surface]            # Governing Eqn for SURFACE CO2 REDUCTION REACTION 
    type = SurfacePCRes
    variable = theta
    ele = u
    vac = v
#    velocity = '1.0 1.0 0.0'
#    dHdd1 = 0
#    dHdd2 = 0
#    dS1 = 0
#    dS2 = 0
#    dH1 = 0
#    dH2 = 0
    block = 2
  [../]

  
[]

[BCs]
  [./Neumann_inlet_u]
    type = NeumannBC
    variable = u
    boundary = top
    value = 2.1
  [../]
  [./Neumann_outlet_u]
    type = NeumannBC
    variable = u
    boundary = 'ceo2_ysz'
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
    boundary = 'ceo2_ysz'
    value = 0
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC
    variable = phi
    boundary = top
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC    # DirichletBC
    variable = phi
    boundary = 'ceo2_ysz'
    value = 0
  [../]

  [./N_inlet_mue]
    type = NeumannBC
    variable = muq
    boundary = top
    value = -5.1e5 #-1e5 #-1e-4 #1e-14
  [../]
  [./muq_ce_au]
    type = DirichletBC
    variable = muq
    boundary = 'ceo2_au'
    value = 94685e-2    
  [../]

  [./N_inlet_muv]
    type = NeumannBC
    variable = muv
    boundary = top
    value = -5.8e4 #-1e3 #-1e-6# 1e-14
  [../]
  [./muv_ce_au]
    type = DirichletBC
    variable = muv
    boundary = 'ceo2_ysz'
    value = 2e5    
  [../]

  [./ysz_pt]
    type = DirichletBC
    variable = phi_ysz
    boundary = ysz_pt
    value = 0
  [../]
  
  [./interface]
    type = CMatchedValueBC
    variable = muv
    boundary = ceo2_ysz
    v = phi_ysz
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
    start_point = '4.5e-3 10e-6 0'
    end_point = '4.5e-3 9.99e-6 0'
    num_points = 125
    variable = 'u v phi muq muv theta'
    sort_by = 'id'
  [../]
  [./long_line]
    type = LineValueSampler
    start_point = '4.5e-3 10e-6 0'
    end_point = '4.5e-3 5e-6 0'
    num_points = 125
    variable = 'u v phi muq muv theta'
    sort_by = 'id'
  [../]
  [./y_line]
    type = LineValueSampler
    start_point = '4.4e-3 10e-6 0'
    end_point = '4.6e-3 10e-6 0'
    num_points = 125
    variable = 'u v phi muq muv theta'
    sort_by = 'id'
  [../]
[]


[Executioner]
  type = Steady

#  type = Transient
#  dt = 0.05
#  num_steps = 2
  
#  solve_type = NEWTON
  nl_max_its = 100
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  petsc_options = '-ksp_converged_reason -snes_converged_reason'

  l_tol = 1.0e-6
  nl_rel_tol = 1.0e-4
  nl_abs_tol = 1.0e-3
 
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
