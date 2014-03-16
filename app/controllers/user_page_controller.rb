class UserPageController < ApplicationController


	def user_home_page

		puts '********************************'			
		puts params[:username]

		@user_to_render = User.first


		quote = Hash.new
		quote[:text] = 'abc'
		quote[:author] = 'xyz'

		quote1 = Hash.new
		quote1[:text] = 'abc'
		quote1[:author] = 'xyz'

		@ary_quotes = [quote, quote1]

		


	end


end