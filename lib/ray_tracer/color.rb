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
end

def color(red, green, blue)
  Color[red, green, blue]
end
