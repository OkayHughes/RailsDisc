class AddPolymorphicIndexComments < ActiveRecord::Migration
  def change
	add_reference :comments, :commentable, polymorhic: true
	add_column :comments, :commentable_type, :integer
        add_index :comments, :commentable_type
    	add_index :comments, :commentable_id
  end
end
