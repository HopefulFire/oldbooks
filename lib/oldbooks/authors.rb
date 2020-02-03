class Oldbooks::Author

	attr_accessor :name, :gender, :nationality, :born, :died, :age

	def initialize(args = {})
		args.each do |k, v|
			self.send("#{k}=", v)
		end
	end

end