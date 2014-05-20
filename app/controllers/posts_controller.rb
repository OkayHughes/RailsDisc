class PostsController < ApplicationController

def index
	#@posts = Post.paginate(page: params[:page], per_page: 10).order('updated_at DESC')
	@posts = Post.all.reverse
end

def show
	@post = Post.find(params[:id])
end

def new
	@post = Post.new
end

def reply
	@post = Post.new
	@parent = Post.find(params[:id])
	@post.parent = @parent
end

def create
	@post = Post.new(post_params)
	@post.user = current_user
	Rails.logger.debug(params[:parent_id])
	if params[:parent_id] != nil
		@post.parent = Posts.find_by(:id, params[:parent_id])
	end

	if @post.save
		redirect_to @post
	else
		render 'new'
	end
end

def edit
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])

	if @post.update(post_params)
		redirect_to @post
	else
		render 'edit'
	end
end

def destroy
	@post = Post.find(params[:id])
	@post.destroy

	redirect_to posts_path
end


private
	def post_params
		params.
			require(:post).
			permit(:title, :content, :parent_id, :group_id)
	end

end