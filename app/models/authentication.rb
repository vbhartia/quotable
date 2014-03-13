class Authentication < ActiveRecord::Base
	
  	attr_accessible :provider, :uid, :profile_pic_url_from_provider, :auth_token

	belongs_to :user

end

