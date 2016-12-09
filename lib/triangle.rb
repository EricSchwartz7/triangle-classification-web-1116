class Triangle

  attr_reader :length, :width, :height
  attr_accessor :type

  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
  end

  def kind
    if valid?
      if length == width && length == height
        type = :equilateral
      elsif length == width || length == height || width == height
        type = :isosceles
      elsif length != width && length != height && height != width
        type = :scalene
      end
    else
      raise TriangleError
    end
  end


  def valid?
    length > 0 && width > 0 && height > 0 && length + width > height && length + height > width && width + height > length
  end

end

class TriangleError < StandardError
  def message
    "This triangle is invalid!"
  end
end
