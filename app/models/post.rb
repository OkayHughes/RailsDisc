class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments,  as: :commentable, dependent: :destroy
	validates :title, presence: true
	validates :content, presence: true
	validates :user, presence: true
end
