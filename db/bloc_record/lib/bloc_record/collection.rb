module BlocRecord
  module Collection
    class Collection < Array
      def update_all(updates)
        ids = self.map(&:id)
        self.any ? self.first.class.update(ids, updates) : false
      end

      def destroy_all
      	self.each do |object|
      		object.destroy
      	end
      	return true
      end
    end
  end
end
