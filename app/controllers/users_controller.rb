class UsersController < ApplicationController

	def show
	  @user = User.find(params[:id])
	end

	def favourites
	  @user = User.find(params[:id])
	end

end
