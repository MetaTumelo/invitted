class PagesController < ApplicationController
	layout "frontpage"
	
	def index
	end
	def show
   		render params[:page]
  	end
end
