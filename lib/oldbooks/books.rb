class Oldbooks::Book

	attr_accessor :title, :author, :info, :date, :url

	def initialize(args)
		args.each do |k, v|
			self.send("#{k}=", v)
		end
	end

end