class AddGroupIdToPosts < ActiveRecord::Migration
  def change
	remove_index :posts, :group
	remove_column :posts, :group
	add_column :posts, :group_id, :integer
	add_index :posts, :group_id
  end
end
