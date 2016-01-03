class LinksController < ApplicationController
	def index
		@link = Link.all
		render 'index'
	end

	def create
		@link = Link.find(params[:original_url])
		@link.add_http
		redirect_to '/new_link'
	end

end

