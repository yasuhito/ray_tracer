# frozen_string_literal: true

# Array をタプルまたはベクターとして扱うための拡張
class Array
  def x
    self[0]
  end

  def y
    self[1]
  end

  def z
    self[2]
  end

  def w
    self[3]
  end

  def point?
    w == 1.0
  end

  def vector?
    w == 0.0
  end
end
