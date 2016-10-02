require_relative 'pixel'
require 'matrix'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width 
    @height = height
    @matrix = Matrix.build(height, width){nil}.to_a
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[y][x] = pixel
  end

  def at(x, y)
    @matrix[x][y]
  end

  private

  def inbounds(x, y)
    
  end

end