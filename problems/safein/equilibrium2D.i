# Equilibrium 2D Model

## Input file ElePhaNT MOOSE app

[Mesh]
  type = GeneratedMesh
  dim = 2                # Mesh dimensions: 1D, 2D, 3D
  nx = 100               # 1D: Number of elements in X-direction 
  ny = 40                # 2D: Number of elements in Y-direction
  nz = 1                 # 3D: Number of elements in Z-direction
  xmax = 30000e-9        # Cell base length [m] = 200 [nm]
  ymax = 1000e-9         # 2D cell height [m] = 30 [nm]
  zmax = 30e-9           # 3D cell width [m] = 30 [nm]
  bias_x = 1.0           # X-bias 0.5 - 2.0 (left - right element-size refinement)
  bias_y = 0.75           # Y-bias 0.5 - 2.0 (top - bottom element-size refinement)
[]

#################################################################################################################
#################################################################################################################

[GlobalParams]
  V = 0.01           # VOLTAGE [V]
  T = 773            # TEMPERATURE [K] = 500 Celsius
  R = 8.314          # GAS CONSTANT [J/mol.K] -> PV=nRT
  
  Dop = 0.1          # FIXED GADOLINIA DOPANT CONCENTRATION
  nq = 4.1488e4      # CATION-ELECTRON SITE DENSITY
  nqq = 1.6595e5     # CATION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nqv = 3.3190e5     # ANION-CATION NEXT-NEAREST-NEIGHBOR DENSITY
  nv = 8.2975e4      # ANION SITE DENSITY 
  nvv = 2.4893e5     # ANION-ANION NEXT-NEAREST-NEIGHBOR DENSITY
 
  fq = 90000         # ELECTRON SELF INTERACTION ENERGY [J/mol]
  fqv = -7000        # ELECTRON-VACANCY INTERACTION ENERGY
  fv = 90000         # VACANCY SELF INTERACTION ENERGY

  gq = 8e-9          # ELECTRON GRADIENT ENERGY COEFFICIENT [J/mol.m]
  gv = 1e-9          # VACANCY GRADIENT ENERGY COEFFICIENT
  F = 96485          # ENERGY (Faraday) CONSTANT [J/mol]

  Pco = 0.2          # CO PARTIAL PRESSURE [atm]
  Pco2 = 0.8         # CO2 PARTIAL PRESSURE [atm]
  
  eta1 = 1e-10       # Pre-EXPONTENTIAL FACTOR: zeta_ads
  eta2 = 1e-10       # Pre-EXPONTENTIAL FACTOR: zeta_inc
  dHdd1 = 5e4        # ADS-1 ENTHALPY DoubleDagger [J] = [Kg.m2/s2]
  dHdd2 = 5e4        # INC-2 ENTHALPY DoubleDagger [J]
  dS1 = 0            # ADS REACTION ENTROPY [J/K] = [Kg.m2/s2.K]
  dS2 = 0            # INC REACTION ENTROPY [J/K]
  dH1 = 7e4          # ADS REACTION ENTHALPY [J]
  dH2 = 6e4          # INC REACTION ENTHALPY [J]  
[]

#################################################################################################################
#################################################################################################################
  
[MeshModifiers]

  [./subdomain_id]
    type = AssignElementSubdomainID
    subdomain_ids = '1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 2 2 2  2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 2 2 2  2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0'
  [../]

  [./side_set1]
    type = SideSetsBetweenSubdomains
    depends_on = subdomain_id
    master_block = '0 1 2'
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

#################################################################################################################
#################################################################################################################
  
[Variables]
active = 'q v phi muq muv phi_ysz theta mut'
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

  [./theta]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.1
    scaling = 1
    block = 0
  [../]
  [./mut]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
    scaling = 1
    block = 0
  [../]

[]

#################################################################################################################
#################################################################################################################
  
[Kernels]
#active = 'phi_kernel electron_kernel vacancy_kernel mu_electron mu_vacancy phi_ysz theta_kernel mu_theta'
  [./phi_kernel]         # Kernel/Governing Eqn for ELECTROSTATIC POTENTIAL
    type = EPotential1D  # Name of physics kernel used
    variable = phi       # Main Variable that kernel is solving
    ele = q              # Coupled variable 1 = coupled electron concentration
    vac = v              # Coupled variable 2 = coupled vacancy concentration
    block = 0
  [../]
  [./electron_kernel]    # Governing Eqn for ELECTRON SITE FRACTION
    type = Electron1D
    variable = q
    vac = v
    phi = phi
    mu = muq
    lambq = 0            # Lagrange multiplier value
    block = 0
  [../]
  [./vacancy_kernel]     # Governing Eqn for VACANCY SITE FRACTION
    type = Vacancy1D
    variable = v
    ele = q
    phi = phi
    mu = muv
    lambv = 0            # Lagrange multiplier value
    block = 0
  [../]

  [./mu_electron]        # Governing Eqn for ELECTRON ELECTROCHEMICAL POTENTIAL
    type = ChemPotential
#    type = SplitPCRes
    variable = muq
    con = q
    Ns = 4.1488e4
    M = 3.15e-10
    block = 0
  [../]
  [./mu_vacancy]         # Governing Eqn for VACANCY ELECTROCHEMICAL POTENTIAL
    type = ChemPotential
#    type = SplitPCRes
    variable = muv
    con = v
    Ns = 8.2975e4
    M =  1.0425e-12
    block = 0
  [../]

  [./phi_ysz]            # Governing Eqn for ELECTROLYTE ELECTROSATIC POTENTIAL = Laplace Eqn
    type = Diffusion
    variable = phi_ysz
    block = 1
  [../]

  
  [./theta_kernel]
    type = Adsorbate1D
    variable = theta
    mu = muq
    block = 0
  [../]
  [./mu_theta]
    type = ChemPotential
#    type = SplitPCRes
    variable = mut
    con = theta
    M = 1e-12 
    Ns = 1.3e-5
    block = 0
  [../]

  [./dt_q]
    type = TimeDerivative
    variable = q
  [../]
  [./dt_v]
    type = TimeDerivative
    variable = v
  [../]
		       
[]

#################################################################################################################
#################################################################################################################

[Functions]
#  [./au_bc]
#    type = ParsedFunction
#    value = 96485*t
#  [../]
[]

#################################################################################################################
#################################################################################################################
  
[BCs]
#active = 'Neumann_inlet_q Neumann_outlet_q Neumann_inlet_v Neumann_outlet_v Neumann_inlet_phi Neumann_outlet_phi N_inlet_muq N_inlet_muv muq_ce_au muv_ce_au surface '

  [./Neumann_inlet_q]
    type = NeumannBC
    variable = q
    boundary = top
    value = 2.5
  [../]
  [./Neumann_outlet_q]
    type = NeumannBC
    variable = q
    boundary = 'ceo2_ysz ceo2_au'
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
    boundary = 'ceo2_ysz ceo2_au' 
    value = 0
  [../]

  [./Neumann_inlet_phi]
    type = NeumannBC
    variable = phi
    boundary = top
    value = 0
  [../]
  [./Neumann_outlet_phi]
    type = NeumannBC #DirichletBC
    variable = phi
    boundary = 'ceo2_ysz ceo2_au'
    value = 0
  [../]

  [./N_inlet_muq]
    type = NeumannBC
    variable = muq
    boundary = top
    value = -1e4  # -1e-4 #1e-14
  [../]
  [./N_inlet_muv]
    type = NeumannBC
    variable = muv
    boundary = top
    value = -1e4  # -1e-6# 1e-14
  [../]
  [./muq_ce_au]
    type = DirichletBC # FunctionDirichletBC
    variable = muq
    boundary = ceo2_au
#    function = au_bc
    value = 96485e-2    
  [../]
  [./interface]
    type = CMatchedValueBC
    variable = muv
    boundary = ceo2_ysz
    v = phi_ysz
  [../]  

  [./surface]
    type = SurfaceBC
    variable = theta
    boundary = top
    ele = q
    vac = v
  [../]
  [./bulk]
    type = DirichletBC
    variable = theta
    boundary = 'ceo2_ysz ceo2_au'
    value = 0
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
    start_point = '22000e-9 1000e-9 0'
    end_point = '26000e-9 1000e-9 0'
    num_points = 100
    variable = 'q v phi muq muv theta mut'
    sort_by = 'id'
  [../]
  [./line_y]
    type = LineValueSampler
    start_point = '20000e-9 1000e-9 0'
    end_point = '20000e-9 950e-9 0'
    num_points = 10
    variable = 'q v phi muq muv theta mut'
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
