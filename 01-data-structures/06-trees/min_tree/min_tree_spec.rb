include RSpec

require_relative 'min_tree.rb'
require_relative 'node.rb'


RSpec.describe MinTree, type: Class do 

	let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinTree.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

	it "is a class" do 
		expect(MinTree.new(:jedi)).to_not be(nil)
	end

  def insert_shit
   tree.insert(root, hope)
   tree.insert(root, empire)
   tree.insert(root, jedi)
   tree.insert(root, martian)
   tree.insert(root, pacific_rim)
   tree.insert(root, inception)
   tree.insert(root, braveheart)
   tree.insert(root, shawshank)
   tree.insert(root, district)
   tree.insert(root, mad_max_2)
  end


  describe "MinTree#insert" do

    it "instantiates properly" do 
      expect(tree.root).to_not be(nil)
    end

    it "inserts lowest values at the root" do 
      expect(tree.root.title).to eq("The Matrix")
      tree.insert(root, braveheart)
      expect(tree.root.title).to eq("Braveheart")
    end
  end

  describe "MinTree#search" do 
    it "finds what it is looking for" do
      insert_shit()
      expect(tree.find(root, donnie).title).to eq("Donnie Darko")
    end
  end


  # describe "Depth first search" do 
  #   it "finds the proper depth to put the node" do 
  #     tree.insert(root, braveheart)
  #     tree.insert(root, shawshank)
  #     tree.insert(root, empire)
  #   end
  # end 

  describe "MinTree#switch" do 
    it "switches the parent and child locations" do 

    end
  end

  describe "assign indices" do 
    it "assigns the index in the array to the node object" do 
      insert_shit
      expect(tree.root.position).to be(1)
      expect(tree.root.left).to_not be(nil)
      expect(tree.root.left).to_not be(nil)
      expect(tree.root.right).to_not be(nil)
    end
  end

	



end