require 'benchmark'
require_relative 'linked_list.rb'
require_relative 'node.rb'

	Benchmark.bmbm(25) do |x|

		@array = [];
		@linkedList = LinkedList.new
		@LL500 = nil

		x.report("Build Array:") {
			1000000.times do |i|
				@array.push(i)
			end
		}

		x.report("Build Linked List:") {
			1000000.times do |i|
				node = Node.new(i)
				@linkedList.add_to_front(node)
			end
		}

		x.report("Read From LinkedList"){
			@LL500 = @linkedList.access_element(500000)
		}

		x.report("Read From Array"){
			@array[499999]
		}

		x.report("Delete From LinkedList") {
			@linkedList.delete(@LL500)
		}

		x.report("Delete From Array"){
			@array.delete_at(5000)
		}


	end