class Oldbooks::Book

	attr_accessor :title, :author, :summary

	def initialize(args)
		args.each do |k, v|
			self.send("#{k}=", v)
		end
	end

end