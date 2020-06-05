[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 100
  ny = 10
  xmax = 0.304 # Length of test chamber
  ymax = 0.0257 # Test chamber radius
[]

[Variables]
  [temperature]
  []
[]

[Functions]
  [./left_bc]
    type = ParsedFunction
    value = 310+90*t
  [../]
[]
  
[Kernels]
  [heat_conduction]
    type = ADHeatConduction
    variable = temperature
  []
[]

[BCs]
  [inlet_temperature]
    type = FunctionDirichletBC
    variable = temperature
    boundary = left
    function = left_bc
#    value = 350 # (K)
  []
  [outlet_temperature]
    type = DirichletBC
    variable = temperature
    boundary = right
    value = 300 # (K)
  []

  [outlet_flux]
    type = NeumannBC
    variable = temperature
    boundary = right
    value = 10
  []
[]

[Materials]
  [steel]
    type = GenericConstantMaterial
    prop_names = thermal_conductivity
    prop_values = 18 # K: (W/m*K) from wikipedia @296K
  []
[]

[Problem]
  type = FEProblem
  coord_type = RZ
  rz_coord_axis = X
[]

[Executioner]
  type = Transient
  dt = 0.1
  solve_type = NEWTON
  end_time = 1

#  type = Steady
#  solve_type = NEWTON
#  petsc_options_iname = '-pc_type -pc_hypre_type'
#  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  exodus = true
[]

[VectorPostprocessors]
  [./line_x]
    type = LineValueSampler
    start_point = '0 0.01 0'
    end_point = '0.304 0.01 0'
    num_points = 256
    variable = 'temperature'
    sort_by = 'id'
  [../]
[]
