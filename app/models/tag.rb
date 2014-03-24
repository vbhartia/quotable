class Tag < ActiveRecord::Base

  attr_accessible :tag_title, :url_slug

  has_many :tag_associated_quotes
  has_many :quotes, :through=> :tag_associated_quotes
 
end
