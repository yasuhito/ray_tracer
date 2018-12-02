# frozen_string_literal: true

require 'bigdecimal'
require 'bigdecimal/util'
require 'ray_tracer/color'
require 'ray_tracer/point'
require 'ray_tracer/vector'

ParameterType(
  name: 'tuple',
  regexp: /tuple.(.+), (.+), (.+), (.+)./,
  type: Tuple,
  transformer: ->(x, y, z, w) { tuple(x.to_d, y.to_d, z.to_d, w.to_d) }
)

ParameterType(
  name: 'point',
  regexp: /point.(.+), (.+), (.+)./,
  type: Tuple,
  transformer: ->(x, y, z) { point(x.to_d, y.to_d, z.to_d) }
)

ParameterType(
  name: 'vector',
  regexp: /vector.(.+), (.+), (.+)./,
  type: Tuple,
  transformer: ->(x, y, z) { vector(x.to_d, y.to_d, z.to_d) }
)

ParameterType(
  name: 'magnitude',
  regexp: /magnitude.(.+)./,
  type: Integer,
  transformer: ->(v) { @variables[v.to_sym].magnitude }
)

ParameterType(
  name: 'normalize',
  regexp: /normalize.(.+)./,
  type: Tuple,
  transformer: ->(v) { @variables[v.to_sym].normalize }
)

ParameterType(
  name: 'dot',
  regexp: /dot.(.+), (.+)./,
  type: Integer,
  transformer: ->(v1, v2) { @variables[v1.to_sym].dot @variables[v2.to_sym] }
)

ParameterType(
  name: 'cross',
  regexp: /cross.(.+), (.+)./,
  type: Tuple,
  transformer: ->(v1, v2) { @variables[v1.to_sym].cross @variables[v2.to_sym] }
)

ParameterType(
  name: 'color',
  regexp: /color.(.+), (.+), (.+)./,
  type: Color,
  transformer: ->(red, green, blue) { color(red.to_d, green.to_d, blue.to_d) }
)
