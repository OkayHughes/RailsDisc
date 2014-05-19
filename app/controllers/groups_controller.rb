class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def show
		@group = Group.find(params[:id])
		@posts = Post.find_by_group_id(params[:id])
	end

	def create
		@group = Group.new(group_params)
		@group.users << current_user
		if @group.save
		    redirect_to groups_path
		else
			render 'new'
		end
	end

	def add
		group = Group.find(params[:group_id])
		user = User.find(params[:user_id])
		if !(group.users.include?(user))
			group.users << user
		end
		redirect_to groups_path
	end

	private
	def group_params
		params.require(:group).permit(:title, :author_id)
	end
end
