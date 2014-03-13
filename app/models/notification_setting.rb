class NotificationSetting < ActiveRecord::Base
	
  	attr_accessible :daily_email

	belongs_to :user

end

