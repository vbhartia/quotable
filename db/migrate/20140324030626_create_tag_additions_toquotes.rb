class CreateTagAdditionsToquotes < ActiveRecord::Migration
  def up
    create_table :tag_associated_quotes do |t|
      t.belongs_to :tag
      t.belongs_to :quote
      t.datetime :assign_date
      t.timestamps
    end
  end

  def down
  end
end
