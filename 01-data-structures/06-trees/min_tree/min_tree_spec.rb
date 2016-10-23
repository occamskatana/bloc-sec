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
   tree.insert(root, district)
   tree.insert(root, mad_max_2)
    tree.insert(root, donnie)
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

    it "assigns left and right pointer values" do 
      tree.insert(root, braveheart)
      tree.insert(root, jedi)
      expect(tree.root.left.title).to eq("The Matrix")
      expect(tree.root.right.title).to eq(jedi.title)
      expect(tree.root.right.parent).to be(tree.root)
      expect(tree.root.left.parent).to be(tree.root)
    end

    it "percolates up properly" do
      tree.insert(root, braveheart)
      expect(tree.root.title).to eq("Braveheart")
    end
  end


  describe "MinTree#search" do 
    it "returns proper searched node" do
      insert_shit
      expect(tree.find(root, donnie).title).to eq(donnie.title)
      expect(tree.find(root, martian).title).to eq(martian.title)
    end

    it "returns nil if not found" do 
      expect(tree.find(root, shawshank)).to eq(nil)
    end
  end

  describe "MinTree#delete" do 
    it "deletes the object from the tree" do 
      insert_shit
      tree.delete(root, hope)
      expect(tree.find(root, hope)).to be(nil)
      expect(tree.find(root, inception)).to_not be_nil
      tree.delete(root, inception)
      expect(tree.find(root, inception)).to be(nil)
    end

    it "should retain heap data structure" do 
      insert_shit
      tree.delete(root, hope)
      tree.delete(root, inception)
      tree.delete(root, braveheart)

      expect(tree.root.left.rating > tree.root.rating).to be(true)
      expect(tree.root.left.left.rating > tree.root.left.rating).to be(true)
      expect(tree.root.right.rating > tree.root.rating).to be(true)
      expect(tree.root.right.right.rating > tree.root.right.rating).to be(true)
    end
  end

  describe "MinTree#print" do 
    it "should print the tree" do 
      expect(tree.print).to eq()
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