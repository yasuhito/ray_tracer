# frozen_string_literal: true

require 'ray_tracer/color'

# レイトレの計算結果を入れるキャンバス
class Canvas
  MAX_COLOR = 255

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

  def to_ppm
    header + body
  end

  private

  def header
    <<~PPM
      P3
      #{@width} #{@height}
      #{MAX_COLOR}
    PPM
  end

  def body
    @pixels.map { |row| row_to_ppm(row) }.join("\n")
  end

  def row_to_ppm(row)
    row.map { |pixel| pixel_to_ppm(pixel) }.join(' ')
  end

  def pixel_to_ppm(pixel)
    (pixel * (MAX_COLOR + 1)).map { |each| scale_color each.to_i }.join(' ')
  end

  def scale_color(color)
    return MAX_COLOR if color > MAX_COLOR
    return 0 if color.negative?

    color
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

def canvas_to_ppm(canvas)
  canvas.to_ppm
end
