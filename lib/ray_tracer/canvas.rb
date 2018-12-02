# frozen_string_literal: true

require 'ray_tracer/color'

# レイトレの計算結果を入れるキャンバス
class Canvas
  attr_reader :width
  attr_reader :height

  def initialize(width, height)
    @width = width
    @height = height
    @pixels = Array.new(height) { Array.new(width) { color(0, 0, 0) } }
  end

  def pixels
    @pixels.flatten(1)
  end

  def write_pixel(x, y, color)
    @pixels[y][x] = color
  end

  def pixel_at(x, y)
    @pixels[y][x]
  end
end

def canvas(width, height)
  Canvas.new(width, height)
end

def write_pixel(canvas, x, y, color)
  canvas.write_pixel x, y, color
end

def pixel_at(canvas, x, y)
  canvas.pixel_at x, y
end
