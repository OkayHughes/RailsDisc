class CommentsController < ApplicationController
	def create

		@comment = Comment.new(comment_params)
		@comment.user = current_user
		if params[:commentable_type] == "Post"
			@comment.commentable = Post.find_by(:id, params[:commentable_id])
		elsif params[:commentable_type] == "Comment"
			@comment.commentable = Comment.find_by(:id, params[:commentable_id])
		end
		
		@comment.save()
		redirect_to request.referer
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

		redirect_to request.referer
	end

	def render_comments 
 			render @post.comments 
	end

	def update
		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
			redirect_to request.referer
		end

	end

	def edit
		@comment = Comment.find(params[:id])
		@id = @comment.commentable_id
		if @comment.commentable_type == "Post"
			@commentable = Post.find( @id)
		elsif @comment.commentable_type == "Comment"
			@commentable = Comment.find(@id)
		end
		@id = @comment.id
		respond_to do |format|
			format.js
		end
	end

	def reply
		@comment = Comment.new()
		@commentable = Comment.find(params[:id])
		@id = params[:id]
		respond_to do |format|
			format.js
		end
	end


	private
	def comment_params
			params.require(:comment).permit(:content, :commentable, :commentable_id, :commentable_type)

	end
end
