# frozen_string_literal: true

require 'ray_tracer/point'

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
