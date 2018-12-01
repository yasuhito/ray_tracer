# frozen_string_literal: true

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
