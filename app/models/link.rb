class Link < ActiveRecord::Base

	def random_link(characters)
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']
		Array.new(characters){ range.sample }.join
	end

	def add_http
		if !self.starts_with?('http://')
			self.link.prepend('http://')
			self.save
		end
	end

	def self.find_or_create_link(permited_params)
		future_link = Link.find(params[:original_url]).add_http
		if !future_link
			new_link = Link.new(permited_params)
			new_link.random_link(3)
			new_link.save
			new_link
		else
			future_link
		end
	end

end

