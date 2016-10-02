# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
# class Line
#   attr_accessor :members

#   def initialize
#     self.members = []
#   end

#   def join(person)
#     self.members.push(person)
#   end

#   def leave(person)
#     self.members.delete(person)
#   end

#   def front
#     return self.members[0]
#   end

#   def middle
#     mid_index = self.members.length / 2
#     return self.members[mid_index]
#   end

#   def back
#     return self.members.last
#   end

#   def search(person)
#     result = nil
#     self.members.each do |member|
#       if member == person 
#         result = member 
#       end
#     end

#     return result
#   end

#   private

#   def index(person)
#   end

# end