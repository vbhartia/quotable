class UserController < ApplicationController

	# OAuth Vertification Settings
	def oauth_create
	  omniauth = request.env["omniauth.auth"]
	  #render :text => omniauth.to_yaml

	  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
	  if authentication
	    flash[:notice] = "Signed in successfully."
	    #render :text => request.env["omniauth.auth"].to_yaml
	    sign_in_and_redirect(:user, authentication.user)
	  elsif current_user
	    current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'], :profile_pic_url_from_provider => omniauth['info']['image'])
	    flash[:notice] = "Authentication successful."
	    
	    render :text => request.env["omniauth.auth"].to_yaml
	  else
	  	
	    user = User.new

		user.apply_omniauth(omniauth)

	    user.save(:validate => false)
		#flash[:notice] = "Signed in successfully."
		

		notification_setting = NotificationSetting.create
		notification_setting.daily_email = false

		notification_setting.save

		user.notification_setting = notification_setting

		user.save

		sign_in_and_redirect(:user, user)

		puts '********************************'
		puts omniauth['email']
	    
	    #render :text => request.env["omniauth.auth"].to_yaml
	  end
	end

	#User Profile Setting Page
	def user_setting_page
		@notification_settings = current_user.notification_setting


	end

	def notification_settings_update
		#change email settings
		@notification_settings = current_user.notification_setting

		@notification_settings.daily_email = params['notification_setting']['daily_email']

		if @notification_settings.save

			respond_to do |format|
	    		msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
	    		format.json  { render :json => msg } # don't do msg.to_json
	  		end
  		end


	end




	def populate_friends
		current_user.facebook.get_connections("me", "friends?fields=id,name,picture.type(normal)").each { |friend|
			individual_friend = FriendList.new
			individual_friend.first_name = friend['name']
			individual_friend.facebook_id = friend['id']
			individual_friend.profile_pic_url = friend['picture']['data']['url']
			individual_friend.user = current_user
			individual_friend.save!
		}
	end



	def profile
	end

	def home
	end

end