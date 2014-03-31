class Author < ActiveRecord::Base

  	attr_accessible :friendly_name, 
  					:slug, 
  					:description, 
  					:image_url

  	has_many :author_associated_quote
  	has_many :quotes, :through=> :author_associated_quote

end