class UserPageController < ApplicationController


	def user_home_page

		puts '********************************'			
		puts params[:username]

		@user_to_render = User.first


		quote = Hash.new
		quote[:text] = 'Shadows and dust maximus, shadows and dust'
		quote[:author] = 'Proximo'

		quote1 = Hash.new
		quote1[:text] = 'Single Column, Single Column, Diamond'
		quote1[:author] = 'Gladiator'

		@ary_quotes = [quote, quote1]


	end


end