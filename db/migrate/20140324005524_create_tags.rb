class CreateTags < ActiveRecord::Migration
  def up
  	create_table :tags do |t|
      t.text :tag_title
    end
  end

  def down
  end
end
