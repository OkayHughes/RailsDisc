class Comment < ActiveRecord::Base
	belongs_to :commentable, :polymorphic => true
	has_many :comments,  :as => :commentable , dependent: :destroy
	belongs_to :user
end
