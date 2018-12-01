# frozen_string_literal: true

# Array をタプルまたはベクターとして扱う
class Tuple < Array
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
    Tuple[x + other.x, y + other.y, z + other.z, w + other.w]
  end

  def -(other)
    Tuple[x - other.x, y - other.y, z - other.z, w - other.w]
  end

  def -@
    Tuple[-x, -y, -z, -w]
  end

  def *(other)
    Tuple[x * other, y * other, z * other, w * other]
  end
end

def tuple(x, y, z, w)
  Tuple[x, y, z, w]
end
