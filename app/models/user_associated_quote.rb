class UserAssociatedQuote < ActiveRecord::Base
	belongs_to :user
  	belongs_to :quote

end