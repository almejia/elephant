# Kinetic 2D Cell Model

## Input file ElePhaNT MOOSE app

[Mesh]
  type = GeneratedMesh
  dim = 2                # Mesh dimensions: 1D, 2D, 3D
  nx = 75               # 1D: Number of elements in X-direction 
  ny = 40                # 2D: Number of elements in Y-direction
  nz = 1                 # 3D: Number of elements in Z-direction
  xmax = 500000e-9        # Cell base length (thickness) [m] = 1000 [nm]
  ymin = -3000000e-9 #-3000000e-9      # 2D cell min height [m] = -2000 [nm]
  ymax = 3000000e-9 #3000000e-9       # 2D cell max height [m] = 2000 [nm]
  zmax = 2000e-9         # 3D cell width [m] = 400 [nm]
  bias_x = 1.226           # X-bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 1             # Y-bias 0.5 - 2.0 (top - bottom element-size refinement)
[]

#################################################################################################################
#################################################################################################################

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
  
  eta1 = -1e3         # Pre-EXPONTENTIAL FACTOR: zeta_ads (max 1e-6 -> converging)
  eta2 = 1e2         # Pre-EXPONTENTIAL FACTOR: zeta_inc (max 1e8)
  dHdd1 = 3.0e4      # ADS-1 ENTHALPY DoubleDagger [J] = [Kg.m2/s2] (4e5)
  dHdd2 = 1.0e4      # INC-2 ENTHALPY DoubleDagger [J] (1e5)
  dS1 = 0            # ADS REACTION ENTROPY [J/K] = [Kg.m2/s2.K]
  dS2 = 0            # INC REACTION ENTROPY [J/K]
  dH1 = 1.0e4        # ADS REACTION ENTHALPY [J] (3e5)
  dH2 = 1.5e4        # INC REACTION ENTHALPY [J] (1.5e5)
[]

#################################################################################################################
#################################################################################################################
  
[MeshModifiers]

  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0

 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0

 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0

 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0'
  [../]

  [./side_set1]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '1 2'
    paired_block = '2'
    new_boundary = 'au_interface'
  [../]
  [./side_set2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1 2'
    paired_block = '3'
    new_boundary = 'ysz_pt'
  [../]
  [./side_set3]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1 2'
    paired_block = '4'
    new_boundary = 'ysz_gas_surface'
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
    master_block = 1
    paired_block = 0
    new_boundary = 'ceo2_ysz'
  [../]
  [./Au_CeO2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 1
    paired_block = 2
    new_boundary = 'ceo2_au'
  [../]
  [./Au_YSZ]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = 0
    paired_block = 2
    new_boundary = 'ysz_au'
  [../]
  
[]

#################################################################################################################
#################################################################################################################
  
[Variables]
active = 'q v phi muq muv theta phi_ysz'
  [./q]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = 1
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.05
    scaling = 1
    block = 1
  [../]
  [./phi]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 1
  [../]
  
  [./muq]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 1
  [../]
  [./muv]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 1
  [../]

  [./phi_ysz]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 0
  [../]

  [./theta]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = 1
  [../]
  [./mut]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 1
  [../]

[]

#################################################################################################################
#################################################################################################################
  
[Kernels]
active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy theta phi_ysz'
#active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy theta_kernel mu_theta'

  [./phi_kernel]           # Kernel/Governing Eqn for ELECTROSTATIC POTENTIAL
    type = EPotential2D    # Name of physics kernel used
    variable = phi         # Main Variable that kernel is solving
    ele = q                # Coupled variable 1 = coupled electron site fraction
    vac = v                # Coupled variable 2 = coupled vacancy site fraction
    block = 1
  [../]
  [./electron_kernel]      # Governing Eqn for ELECTRON SITE FRACTION
    type = Electron2D
    variable = q
    vac = v
    phi = phi
    mu = muq
    lambq = 0              # Lagrange multiplier value
    block = 1
  [../]
  [./vacancy_kernel]       # Governing Eqn for VACANCY SITE FRACTION
    type = Vacancy2D
    variable = v
    ele = q
    phi = phi
    mu = muv
    lambv = 0              # Lagrange multiplier value
    block = 1
  [../]

  [./mu_electron]          # Governing Eqn for ELECTRON ELECTROCHEMICAL POTENTIAL
    type = ChemPotential   # Active kernel that couples electrochemical potential of electrons and electron site fraction concentration
#    type = SplitPCRes
    variable = muq         # Main variable for this kernel is the electrochemical potential of electrons (Mu_q)
    con = q                # Coupled variable = electron site fraction concentration
    Ns = 4.1488e4          # Site density
    M = 3.15e-10           # Electron mobility
    block = 1
  [../]
  [./mu_vacancy]           # Governing Eqn for VACANCY ELECTROCHEMICAL POTENTIAL
    type = ChemPotential
#    type = SplitPCRes
    variable = muv
    con = v
    Ns = 8.2975e4
    M =  1.0425e-12
    block = 1
  [../]


  [./theta]
    type = SurfacePC
    variable = theta
    Ns = 1.3e-5
    Mob = 1e-4
    block = 1
  [../]
  
  [./theta_kernel]
    type = Adsorbate1D
    variable = theta
    mu = mut
    nq = 1.3e-5
    block = 1
  [../]
  [./mu_theta]
    type = ChemPotential
#    type = SplitPCRes
    variable = mut
    con = theta
    Ns = 1.3e-5
    M = 1e-4
    block = 1
  [../]


  [./q_dot]
    type = TimeDerivative
    variable = q
    block = 1
  [../]
  [./v_dot]
    type = TimeDerivative
    variable = v
    block = 1
  [../]

  [./phi_ysz]            # Governing Eqn for ELECTROLYTE ELECTROSATIC POTENTIAL = Laplace Eqn
    type = Diffusion
    variable = phi_ysz
    block = 0
  [../]

		       
[]

#################################################################################################################
#################################################################################################################

[Functions]
  [./au_bc]
    type = ParsedFunction
    value = 964.85*t*t
  [../]
[]

#################################################################################################################
#################################################################################################################
  
[BCs]
#active = 'Neumann_inlet_q Neumann_outlet_q Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi N_inlet_muq N_inlet_muv muq_ce_au muv_ce_au surface interface'
active = 'Neumann_inlet_q Neumann_outlet_q Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi N_inlet_muq N_inlet_muv muq_ce_au surface interface ysz_pt'

  [./Neumann_inlet_q]
    type = SurfaceNeumannBC
    variable = q
    boundary = left
    Ns = 1.3e-5
    fo = 2e5
    #value = 2.5
  [../]
  [./Neumann_outlet_q]
    type = NeumannBC
    variable = q
    boundary = ceo2_ysz
    value = 0
  [../]

  [./Neumann_inlet_v]
    type = SurfaceNeumannBC
    variable = v
    boundary = left
    Ns = 2.6e-5
    fo = 1.6441e5
    #value = 4.2746 
  [../]
  [./Neumann_outlet_v]
    type = NeumannBC
    variable = v
    boundary = ceo2_ysz 
    value = 0
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC #SurfaceFluxBC #NeumannBC
    variable = phi
    #theta = theta
    boundary = left
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC #DirichletBC
    variable = phi
    boundary = ceo2_ysz
    value = 0
  [../]

  [./N_inlet_muq]
    type = CoupledFluxBC  #DirichletBC #NeumannBC#
    variable = muq
    boundary = left 
    #value = -1e4  # -1e-4 #1e-14
    alpha = 2
    the = theta
    ele = q
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
    ele = q
    vac = v
    Ns = 8.2975e4
    M =  1.0425e-12
  [../]
  [./muq_ce_au]
    type = FunctionDirichletBC
    variable = muq
    boundary = au_interface
    function = au_bc
#    value = 96485e-2    
  [../]
  [./muv_ce_au]
    type = DirichletBC
    variable = muv
    boundary = ceo2_ysz
    value = 8e5 #2e5
  [../]

  [./interface]
    type = CMatchedValueBC
    variable = phi_ysz
    boundary = ceo2_ysz
    v = muv
    nv = 0
  [../]  


  [./surface]
    type = CSurface
    variable = theta
    boundary = left
    ele = q
    vac = v
  [../]
  [./bulk]
    type = DirichletBC
    variable = theta
    boundary = ceo2_ysz
    value = 0
  [../]

  [./ysz_pt]
    type = DirichletBC
    variable = phi_ysz
    boundary = ysz_pt
    value = 0
  [../]

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
    start_point = '0 1000e-9 0'
    end_point = '5e-9 1000e-9 0'
    num_points = 100
    variable = 'q v phi muq muv theta'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '0 500e-9 0'
    end_point = '0 1500e-9 0'
    num_points = 100
    variable = 'q v phi muq muv theta'
    sort_by = 'id'
  [../]
[]

#################################################################################################################
#################################################################################################################

[Executioner]

  type = Transient
  dt = 0.1
  solve_type = NEWTON
  end_time = 1

  
#  type = Steady

#  solve_type = NEWTON
  nl_max_its = 300
  l_max_its = 100
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

#  l_tol = 1.0e-6
#  nl_rel_tol = 1.0e-6
#  nl_abs_tol = 1.0e-6
		       
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
