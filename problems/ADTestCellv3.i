# Kinetic 2D Cell Model

## Input file ElePhaNT MOOSE app

[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2                # Mesh dimensions: 1D, 2D, 3D
    nx = 60                # 1D: Number of elements in X-direction 
    ny = 40                # 2D: Number of elements in Y-direction
    nz = 1                 # 3D: Number of elements in Z-direction
    xmax = 1000000e-9         # Cell base length [m] = 200 [nm]
    ymin = -2500000e-9
    ymax = 2500000e-9         # 2D cell height [m] = 400 [nm]
    zmax = 2000e-9         # 3D cell width [m] = 400 [nm]
    bias_x = 1.35           # X-bias 0.5 - 2.0 (left - right element-size refinement)
    bias_y = 1             # Y-bias 0.5 - 2.0 (top - bottom element-size refinement)
  []
  [subdomain_id]
    type = ElementSubdomainIDGenerator
    input = gen
    subdomain_ids = '
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    5 5 5 5 5 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0'
  []
  [side_set1]
    type = SideSetsBetweenSubdomainsGenerator
    input = subdomain_id
    primary_block = '1 2'
    paired_block = '2'
    new_boundary = 'au_interface'
  []
  [./side_set2]
    type = SideSetsBetweenSubdomainsGenerator
    input = side_set1
    primary_block = '0 1 2'
    paired_block = '3'
    new_boundary = 'ysz_pt'
  [../]
  [./side_set3]
    type = SideSetsBetweenSubdomainsGenerator
    input = side_set2
    primary_block = '0 1 2'
    paired_block = '4'
    new_boundary = 'ysz_gas_surface'
  [../]
  [./side_set4]
    type = SideSetsBetweenSubdomainsGenerator
    input = side_set3
    primary_block = '0 1'
    paired_block = '5'
    new_boundary = 'ceo2_surface'
  [../]

  [./delete_subdomain1]
    type = BlockDeletionGenerator
    input = side_set4
    block_id = 2
  [../]
  [./delete_subdomain2]
    type = BlockDeletionGenerator
    input = delete_subdomain1
    block_id = 3
  [../]
  [./delete_subdomain3]
    type = BlockDeletionGenerator
    input = delete_subdomain2
    block_id = 4
  [../]
  [./delete_subdomain4]
    type = BlockDeletionGenerator
    input = delete_subdomain3
    block_id = 5
  [../]

  [./break_boundary]
    type = BreakBoundaryOnSubdomainGenerator
    input = delete_subdomain4
  [../]

  [./CeO2_surface]
    type = SideSetsBetweenSubdomainsGenerator
    input = break_boundary
    primary_block = 1
    paired_block = 5
    new_boundary = 'ceo2_surface'
  [../]
  [./CeO2_YSZ]
    type = SideSetsBetweenSubdomainsGenerator
    input = CeO2_surface
    primary_block = 1
    paired_block = 0
    new_boundary = 'ceo2_ysz'
  [../]
  [./Au_CeO2]
    type = SideSetsBetweenSubdomainsGenerator
    input = CeO2_YSZ
    primary_block = 1
    paired_block = 2
    new_boundary = 'ceo2_au'
  [../]
  [./Au_YSZ]
    type = SideSetsBetweenSubdomainsGenerator
    input = Au_CeO2
    primary_block = 0
    paired_block = 2
    new_boundary = 'ysz_au'
  [../]
  
[]

#################################################################################################################
#################################################################################################################

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
 
  fqq = 76100         # ELECTRON SELF INTERACTION ENERGY
  fqv = -16600       # ELECTRON-VACANCY INTERACTION ENERGY
  fqy = 5000         # ELECTRON-DOPANT INTERACTION ENERGY
  fyv = -40000       # VACANCY-DOPANT INTERACTION ENERGY
  fvv = 57400         # VACANCY SELF INTERACTION ENERGY

  gq = 1.18e-9       # ELECTRON GRADIENT ENERGY COEFFICIENT
  gv = 1.07e-9       # VACANCY GRADIENT ENERGY COEFFICIENT

  Pco = 0.004        # CO PARTIAL PRESSURE [atm] (0.04)
  Pco2 = 0.2         # CO2 PARTIAL PRESSURE [atm]

  lambv = 8.2975e4          # 1e5
  lambd = 4.1488e4          # 1e5
    
  eta1 = 1e3         # Pre-EXPONTENTIAL FACTOR: zeta_ads (max 1e-6 -> converging)
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
active = ''
  [./subdomain_id]
    type = AssignElementSubdomainID
#    type = ElementSubdomainIDGenerator
    subdomain_ids = '
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 3 3 3 3 3  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    5 5 5 5 5 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5  5 5 5 5 5 5 5 5 5 5  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0

    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 2 2 2 2  0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0'
  [../]

  [./side_set1]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = '1 2'
    paired_block = '2'
    new_boundary = 'au_interface'
  [../]
  [./side_set2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = '0 1 2'
    paired_block = '3'
    new_boundary = 'ysz_pt'
  [../]
  [./side_set3]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = '0 1 2'
    paired_block = '4'
    new_boundary = 'ysz_gas_surface'
  [../]
  [./side_set4]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = '0 1'
    paired_block = '5'
    new_boundary = 'ceo2_surface'
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
  [./delete_subdomain4]
    type = BlockDeleter
    depends_on = side_set4
    block_id = 5
  [../]

  [./break_boundary]
    type = BreakBoundaryOnSubdomain
    depends_on = subdomain_id
  [../]

  [./CeO2_surface]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = 1
    paired_block = 5
    new_boundary = 'ceo2_surface'
  [../]
  [./CeO2_YSZ]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = 1
    paired_block = 0
    new_boundary = 'ceo2_ysz'
  [../]
  [./Au_CeO2]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = 1
    paired_block = 2
    new_boundary = 'ceo2_au'
  [../]
  [./Au_YSZ]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    primary_block = 0
    paired_block = 2
    new_boundary = 'ysz_au'
  [../]
  
[]

#################################################################################################################
#################################################################################################################
  
[Variables]
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
[]

#################################################################################################################
#################################################################################################################
  
[Kernels]

  [./phi_kernel]           # Kernel/Governing Eqn for ELECTROSTATIC POTENTIAL
    type = ADEPotential      # Name of physics kernel used
    variable = phi         # Main Variable that kernel is solving
    ele = q                # Coupled variable 1 = coupled electron site fraction
    vac = v                # Coupled variable 2 = coupled vacancy site fraction
    block = 1
  [../]
  [./electron_kernel]      # Governing Eqn for ELECTRON SITE FRACTION
    type = ADElectronKin #Eq
    variable = q
    vac = v
    phi = phi
    muq = muq
    #lambq = 0              # Lagrange multiplier value
    block = 1
  [../]
  [./vacancy_kernel]       # Governing Eqn for VACANCY SITE FRACTION
    type = ADVacancyKin #Eq
    variable = v
    ele = q
    phi = phi
    muv = muv
    #lambv = 0              # Lagrange multiplier value
    block = 1
  [../]

  [./mu_electron]          # Governing Eqn for ELECTRON ELECTROCHEMICAL POTENTIAL
    type = ADChemPotential   # Active kernel that couples electrochemical potential of electrons and electron site fraction concentration
    variable = muq         # Main variable for this kernel is the electrochemical potential of electrons (Mu_q)
    con = q                # Coupled variable = electron site fraction concentration
    Ns = 4.1488e4          # Site density
    M = 3.15e-10           # Electron mobility
    block = 1
  [../]
  [./mu_vacancy]           # Governing Eqn for VACANCY ELECTROCHEMICAL POTENTIAL
    type = ADChemPotential
    variable = muv
    con = v
    Ns = 8.2975e4
    M =  1.0425e-12
    block = 1
  [../]

  [./theta]
    type = ADSurfacePC
    variable = theta
    Ns = 1.3e-5
    Mob = 1e-4
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
active = 'Neumann_inlet_q Neumann_outlet_q Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi N_inlet_muq N_inlet_muv muq_ce_au interface ysz_pt surface'

  [./Neumann_inlet_q]
    type = SurfaceNeumannBC
    variable = q
    boundary = 'left ceo2_surface_to_1'
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
    boundary = 'left ceo2_surface_to_1'
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
    boundary = 'left ceo2_surface_to_1'
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC #DirichletBC
    variable = phi
    boundary = ceo2_ysz
    value = 0
  [../]

  [./N_inlet_muq]
    #type = NeumannBC
    type = ADCoupledFluxBC  #DirichletBC #NeumannBC#
    variable = muq
    boundary = 'left ceo2_surface_to_1' 
    #value = -1e4  # -1e-4 #1e-14
    alpha = 2
    the = theta
    ele = q
    vac = v
    Ns = 4.1488e4
    M = 3.15e-10
  [../]
  [./N_inlet_muv]
    type = ADCoupledFluxBC #NeumannBC#DirichletBC #NeumannBC#
    #type = NeumannBC
    variable = muv
    boundary = 'left ceo2_surface_to_1'
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
    type = MatchedValueBC #ADVectorMatchedValueBC #CMatchedValue2DBC
    variable = muv 
    boundary = ceo2_ysz
    v = phi_ysz
    #nv = 0
  [../]  
  [./interface2]
    type = MatchedValueBC
    variable = phi_ysz 
    boundary = ceo2_ysz
    v = muv
  [../]  

  [./interface3]
    type = CMatchedValueBC
    variable = phi_ysz 
    boundary = ceo2_ysz
    v = muv
    nv = 0
  [../]  
  [./interface4]
    type = MatchedElectrodeBC
    variable = phi_ysz 
    boundary = ceo2_ysz
    v = muv
    nv = 0
  [../]  
  [./interface5]
    type = DirichletBC
    variable = phi_ysz 
    boundary = ceo2_ysz
    value = 1e5
  [../]  

  [./surface]
    type = ADSurface
    variable = theta
    boundary = 'left ceo2_surface_to_1'
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
  [./surface]
    type = SideIntegralVariablePostprocessor
    variable = q
    boundary = left
  [../]
  [./surface_flux_electrons]
    type = SideFluxIntegral
    variable = q
    diffusivity = 1
    boundary = left
  [../]
  [./surface_flux_average_electrons]
    type = SideFluxAverage
    variable = q
    diffusivity = 1
    boundary = left
  [../]
  [./surface_flux_phi]
    type = SideFluxIntegral
    variable = phi
    diffusivity = 1
    boundary = left
  [../]
  [./q_residual]
    type = VariableResidual
    variable = q
  [../]
[]

#################################################################################################################
#################################################################################################################
  
[VectorPostprocessors]
  [./line_x]
    type = LineValueSampler
    start_point = '0 1.25e-3 0'
    end_point = '5e-9 1.25e-3 0'
    num_points = 100
    variable = 'q v phi muq muv theta'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '0 500e-9 0'
    end_point = '0 9500e-9 0'
    num_points = 100
    variable = 'q v phi muq muv theta'
    sort_by = 'id'
  [../]
  [./line_y2]
    type = LineValueSampler
    start_point = '0 0 0'
    end_point = '0 2.5e-3 0'
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
  nl_max_its = 3000
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
