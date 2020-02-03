class Oldbooks::Author

	attr_accessor :name, :gender, :nationality, :born, :died, :age
	attr_reader :books

	def initialize(args = {})
		args.each do |k, v|
			self.send("#{k}=", v)
		end
		@books = []
	end

end