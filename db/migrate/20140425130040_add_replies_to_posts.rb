class AddRepliesToPosts < ActiveRecord::Migration
  def change
  	add_reference :posts, :parent
  end
end
