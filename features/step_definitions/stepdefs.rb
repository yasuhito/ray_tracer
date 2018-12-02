# frozen_string_literal: true

require 'minitest/spec'

# Minitest を Cucumber で使うためのクラス
# https://github.com/cucumber/cucumber/wiki/Using-MiniTest
class MinitestWorld
  include Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0
  end
end

World { MinitestWorld.new }

Given('{word} ← {tuple}') do |variable, tuple|
  @variables ||= {}
  @variables[variable.to_sym] = tuple
end

Then('{word}.{word} = {float}') do |variable, attr, float|
  assert_equal float, @variables[variable.to_sym].__send__(attr)
end

Then('{word} is a point') do |variable|
  assert @variables[variable.to_sym].point?
end

Then('{word} is not a vector') do |variable|
  assert !@variables[variable.to_sym].vector?
end

Then('{word} is not a point') do |variable|
  assert !@variables[variable.to_sym].point?
end

Then('{word} is a vector') do |variable|
  assert @variables[variable.to_sym].vector?
end

Given('{word} ← {point}') do |variable, point|
  @variables ||= {}
  @variables[variable.to_sym] = point
end

Then('{word} = {tuple}') do |variable, tuple|
  assert_equal tuple, @variables[variable.to_sym]
end

Given('{word} ← {vector}') do |variable, vector|
  @variables ||= {}
  @variables[variable.to_sym] = vector
end

Then('{word} + {word} = {tuple}') do |variable1, variable2, tuple|
  assert_equal tuple, @variables[variable1.to_sym] + @variables[variable2.to_sym]
end

Then('{word} - {word} = {vector}') do |variable1, variable2, vector|
  assert_equal vector, @variables[variable1.to_sym] - @variables[variable2.to_sym]
end

Then('{word} - {word} = {point}') do |variable1, variable2, point|
  assert_equal point, @variables[variable1.to_sym] - @variables[variable2.to_sym]
end

Then('-{word} = {tuple}') do |variable, tuple|
  assert_equal tuple, -@variables[variable.to_sym]
end

Then('{word} * {float} = {tuple}') do |variable, float, tuple|
  assert_equal tuple, @variables[variable.to_sym] * float
end

Then("{word} \/ {int} = {tuple}") do |variable, int, tuple|
  assert_equal tuple, @variables[variable.to_sym] / int
end

Then('{magnitude} = {int}') do |magnitude, int|
  assert_equal int, magnitude
end

Then('{magnitude} = √{int}') do |magnitude, int|
  assert_equal Math.sqrt(int), magnitude
end

Then('{normalize} = {vector}') do |normalize, vector|
  assert_equal vector, normalize
end

Then('{normalize} = approximately {vector}') do |normalize, vector|
  assert vector =~ normalize
end

When('{word} ← {normalize}') do |variable, normalize|
  @variables ||= {}
  @variables[variable.to_sym] = normalize
end

Then('{dot} = {int}') do |dot, int|
  assert_equal int, dot
end

Then('{cross} = {vector}') do |cross, vector|
  assert_equal vector, cross
end

Given('{word} ← {color}') do |variable, color|
  @variables ||= {}
  @variables[variable.to_sym] = color
end

Then('{word} + {word} = {color}') do |variable1, variable2, color|
  assert_equal color, @variables[variable1.to_sym] + @variables[variable2.to_sym]
end

Then('{word} - {word} = {color}') do |variable1, variable2, color|
  assert_equal color, @variables[variable1.to_sym] - @variables[variable2.to_sym]
end

Then('{word} * {float} = {color}') do |variable, float, color|
  assert_equal color, @variables[variable.to_sym] * float
end

Then('{word} * {word} = {color}') do |variable1, variable2, color|
  assert_equal color, @variables[variable1.to_sym] * @variables[variable2.to_sym]
end

Given('{word} ← {canvas}') do |variable, canvas|
  @variables ||= {}
  @variables[variable.to_sym] = canvas
end

Then('{word}.{word} = {int}') do |variable, attr, int|
  assert_equal int, @variables[variable.to_sym].__send__(attr)
end

Then('every pixel of {word} is {color}') do |variable, color|
  @variables[variable.to_sym].pixels.all? do |each|
    assert_equal color, each
  end
end

When('{write_pixel}') { |write_pixel| }

Then('{pixel_at} = {word}') do |pixel_at, color|
  assert_equal @variables[color.to_sym], pixel_at
end

When('{word} ← {canvas_to_ppm}') do |variable, canvas_to_ppm|
  @variables ||= {}
  @variables[variable.to_sym] = canvas_to_ppm
end

Then('lines {int}-{int} of {word} are') do |lineno1, lineno2, variable, string|
  assert_equal string.chomp, @variables[variable.to_sym].lines[(lineno1 - 1)..(lineno2 - 1)].join.chomp
end
