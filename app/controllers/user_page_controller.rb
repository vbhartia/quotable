#Generates the homepage for users.

class UserPageController < ApplicationController

	def user_home_page

		@user_to_render = User.where(:username => params[:username]).first

		@quotes_to_render = @user_to_render.quotes

		#Show User Followers
		@followers = @user_to_render.followers

		#User Tag Cloud
		
		tag_cloud = Hash.new

		@quotes_to_render.each do |quote|

			quote.tags.each do |tag|
			
				@tag_cloud[tag.url_slug] = tag

			end 

		end


	end

end