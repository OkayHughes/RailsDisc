class RemovePostIdFromComments < ActiveRecord::Migration
  def change
	remove_column :comments, :post_id
  end
end
