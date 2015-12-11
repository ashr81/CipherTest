module ScrollsHelper
	class MinMaxStore
		attr_accessor :min, :max
		def initialize(min,max)
			@min = min
			@max = max
		end
	end
end
