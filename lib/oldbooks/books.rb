class Oldbooks::Book

	attr_accessor :title, :author, :publisher, :condition, :price, :url

	ALL = []

	def initialize(args = {})
		args.each do |key, value|
			self.send("#{key}=", value)
		end
	end

	def self.create(args = {})
		book = new(args)
		ALL << book
		book
	end

	def self.clear_all
		ALL.clear
	end

end