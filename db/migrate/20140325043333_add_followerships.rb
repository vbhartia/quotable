class AddFollowerships < ActiveRecord::Migration
  def up
    create_table :followerships do |t|
      t.belongs_to :user
      t.belongs_to :follower
  	end
  end

  def down
  end
end
