# frozen_string_literal: true

require 'ray_tracer/point'
require 'ray_tracer/vector'

ParameterType(
  name: 'tuple',
  regexp: /tuple.(.+), (.+), (.+), (.+)./,
  type: Array,
  transformer: ->(x, y, z, w) { [x.to_f, y.to_f, z.to_f, w.to_f] }
)

ParameterType(
  name: 'point',
  regexp: /point.(.+), (.+), (.+)./,
  type: Array,
  transformer: ->(x, y, z) { point(x.to_f, y.to_f, z.to_f) }
)

ParameterType(
  name: 'vector',
  regexp: /vector.(.+), (.+), (.+)./,
  type: Array,
  transformer: ->(x, y, z) { vector(x.to_f, y.to_f, z.to_f) }
)
