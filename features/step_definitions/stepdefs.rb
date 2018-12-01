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
