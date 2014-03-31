class Quote < ActiveRecord::Base

  has_many :user_associated_quotes
  has_many :users, :through=> :user_associated_quotes

  has_many :tag_associated_quotes
  has_many :tags, :through=> :tag_associated_quotes

  has_many :votes

  has_many :author_associated_quote
  has_many :authors, :through=> :author_associated_quote

  attr_accessible :author, :quote_text

  

end
