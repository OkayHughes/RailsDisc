class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	belongs_to :parent, class_name: "Post"
	has_many :comments,  as: :commentable, dependent: :destroy
	has_many :replies, class_name: "Post", foreign_key: "parent_id"
	validates :title, presence: true
	validates :content, presence: true
	validates :user, presence: true
	validates :group, presence: true
end
