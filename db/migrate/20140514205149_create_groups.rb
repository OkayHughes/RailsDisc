class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
	t.text :title
	t.integer :user_id
	t.index :user_id 
    end
  end
end
