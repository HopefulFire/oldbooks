class Oldbooks::Author

	attr_accessor :name, :gender, :nationality, :born, :died, :age
	attr_reader :books

	ALL = []

	def initialize(args = {})
		args.each do |k, v|
			self.send("#{k}=", v)
		end
		@books = []
	end

	def add_book(book)
		book.author = self
		@books << book
	end

	def self.create(args = {})
		author = new(args)
		ALL << author
		author
	end

	def self.clear_all
		ALL.clear
	end

end