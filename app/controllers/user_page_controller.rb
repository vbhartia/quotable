class UserPageController < ApplicationController


	def user_home_page

		puts '********************************'			
		puts params[:username]

		@user_to_render = User.first


		quote = Hash.new
		quote[:text] = 'Shadows and dust maximus, shadows and dust'
		quote[:author] = 'Proximo'
		quote[:tags] = ['Inspirational', 'Gladiator']

		quote1 = Hash.new
		quote1[:text] = 'Single Column, Single Column, Diamond'
		quote1[:author] = 'Gladiator'
		quote1[:tags] = ['Inspirational', 'Gladiator']

		@ary_quotes = [quote, quote1]

		@followers = User.all

	end

end