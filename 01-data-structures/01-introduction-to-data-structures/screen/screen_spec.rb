include RSpec
require 'matrix'

require_relative 'screen'

RSpec.describe Screen, type: Class do
  let(:screen) { Screen.new(10, 10) }

  describe "#insert" do
    it "inserts a pixel at the proper x, y coordinates" do
      p = Pixel.new(255, 255, 255, 1, 1)
      screen.insert(p, 1, 1)
      expect(screen.at(1, 1)).to eq p
    end

  describe "matrix" do 
    it "builds a properly dimensioned matrix upon instantiation and converts it to array for ease of use" do 
      expect(screen.matrix).to eq(Matrix.build(10, 10){nil}.to_a)
    end
  end

    it "retains color information upon insertion" do
      p = Pixel.new(255, 255, 255, 1, 1)
      screen.insert(p, 1, 1)
      p1 = screen.at(1, 1)
      expect(p1.red).to eq p.red
      expect(p1.green).to eq p.green
      expect(p1.blue).to eq p.blue
    end
  end

  describe "#at" do
    it "returns the pixel at a specific location" do
      screen.insert(p, 1, 2)
      p1 = screen.at(1, 2)
      expect(p).to eq p1
    end

    it "handles invalid x, y values gracefully" do
      p = screen.at(-1, -1)
      expect(p).to eq nil
    end
  end

end
