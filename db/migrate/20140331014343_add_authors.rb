class AddAuthors < ActiveRecord::Migration
  def up
    create_table :authors do |t|
      t.string :friendly_name
      t.string :slug
      t.text :description
      t.string :image_url
 	end
  end

  def down
  end
end
