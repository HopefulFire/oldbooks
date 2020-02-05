class Oldbooks::Book

	attr_accessor :title, :author, :info, :date, :url

	ALL = []

	def initialize(args = {})
		args.each do |k, v|
			self.send("#{k}=", v)
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
