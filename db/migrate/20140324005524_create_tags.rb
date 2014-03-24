class CreateTags < ActiveRecord::Migration
  def up
  	create_table :tags do |t|
      t.text :tag_title
      t.text :url_slug
    end
  end

  def down
  end
end
