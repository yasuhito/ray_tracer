# frozen_string_literal: true

# Array をタプルまたはベクターとして扱う
class Tuple < Array
  EPSILON = 0.00001

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

  def +(other)
    Tuple.new(zip(other).map { |v1, v2| v1 + v2 })
  end

  def -(other)
    Tuple.new(zip(other).map { |v1, v2| v1 - v2 })
  end

  def -@
    Tuple[-x, -y, -z, -w]
  end

  def *(other)
    Tuple.new(map { |each| each * other })
  end

  def /(other)
    Tuple[x / other, y / other, z / other, w / other]
  end

  def magnitude
    Math.sqrt(x**2 + y**2 + z**2 + w**2)
  end

  def normalize
    m = magnitude
    Tuple[x / m, y / m, z / m, w / m]
  end

  def =~(other)
    (self - other).all? { |each| each.abs < EPSILON }
  end

  def dot(other)
    zip(other).map { |v1, v2| v1 * v2 }.inject(:+)
  end

  # rubocop:disable AbcSize
  def cross(other)
    Tuple[y * other.z - z * other.y,
          z * other.x - x * other.z,
          x * other.y - y * other.x,
          0.0]
  end
  # rubocop:enable AbcSize
end

def tuple(x, y, z, w)
  Tuple[x, y, z, w]
end
