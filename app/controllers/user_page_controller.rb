#Generates the homepage for users.

class UserPageController < ApplicationController

	def user_home_page

		puts '********************************'			
		puts params[:username]

		@user_to_render = User.where(:username => params[:username]).first

		@quotes_to_render = @user_to_render.quotes

		puts @quotes_to_render.length

		@followers = User.all

	end

end