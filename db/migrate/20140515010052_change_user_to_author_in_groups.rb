class ChangeUserToAuthorInGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :user_id
    add_column :groups, :author_id, :integer
  end
end
