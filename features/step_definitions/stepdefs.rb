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
