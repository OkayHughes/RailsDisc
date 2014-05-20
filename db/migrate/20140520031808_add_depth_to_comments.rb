class AddDepthToComments < ActiveRecord::Migration
  def change
    add_column :comments, :depth, :integer
  end
end
