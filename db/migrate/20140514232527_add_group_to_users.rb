class AddGroupToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :group
    add_column :users, :group, :integer
    
  end
end
