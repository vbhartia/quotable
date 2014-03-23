class Quote < ActiveRecord::Base

  has_many :user_associated_quotes
  has_many :users, :through=> :user_associated_quotes

  attr_accessible :author, :quote_text

  

end
