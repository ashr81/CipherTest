module CipherHelper
	def self.convert_to_array(term)
		arr = []
		term[0].forestarea.each do |a,b|
			arr << b
		end
		term[0].employment.each do |a,b|
			arr << b
		end
		term[0].literacyrate.each do |a,b|
			arr << b
		end
		term[0].mentowoman.each do |a,b|
			arr << b
		end
		arr
	end
end
