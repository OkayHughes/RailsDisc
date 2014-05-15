
class AddGroupToPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :group
	add_column :posts, :group, :integer
	add_index :posts, :group
  end
end
