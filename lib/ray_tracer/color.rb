# frozen_string_literal: true

require 'ray_tracer/tuple'

# 色を表すタプル
class Color < Tuple
  def red
    self[0]
  end

  def green
    self[1]
  end

  def blue
    self[2]
  end

  def *(other)
    if other.is_a?(Color)
      Tuple.new(zip(other).map { |v1, v2| v1 * v2 })
    else
      super other
    end
  end
end

def color(red, green, blue)
  Color[red, green, blue]
end
