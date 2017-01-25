module BlocRecord
	module Collection
		require 'bloc_record/utility'
		class Collection < Array

			def update_all(updates)
				ids = self.map(&:id)
				self.any ? self.first.class.update(ids, updates) : false
			end

			def take(num=1)
				return self[0..num]
			end

			def where(args_hash, not_param=false)
				key = args_hash.keys[0]
				values = args_hash.values[0]
				self.each do |item|
					if not_param == false 
						if item.key != item.value
							self.delete(item)
						end
					else
						if item.key == item.value 
							self.delete(item)
						end
					end
				end
				return self
			end

			def where.not(args_hash)
				self.where(args_hash, not_param=true)
			end
		end
	end
end
