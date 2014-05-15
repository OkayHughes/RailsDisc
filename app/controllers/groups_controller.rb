class GroupsController < ApplicationController
	
	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
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

	private
	def group_params
		params.require(:group).permit(:title, :author_id)
	end
end
