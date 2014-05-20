class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		if @comment.commentable_type == "Post"
			@comment.commentable = Post.find(@comment.commentable_id)
			@div_id = "comments_post_#{@comment.commentable_id}"
			@post_id = "post_comments_reply_#{@comment.commentable_id}"
			@comment.depth = 0
		elsif @comment.commentable_type == "Comment"
			@comment.commentable = Comment.find(@comment.commentable_id)
			@div_id = "comments_comment_#{@comment.commentable_id}"
 			@post_id = ""
			@comment.depth = @comment.commentable.depth + 1
		end
		@comment.save()
		respond_to do |format|
			format.js 
			format.html {}
		end
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

		@comment.update(comment_params)

		if @comment.commentable_type == "Post"
			@div_id = "comments_post_#{@comment.commentable.id}"
		elsif @comment.commentable_type == "Comment"
			@div_id = "comments_comment_#{@comment.commentable.id}"
		end
		respond_to do |format|
			format.js
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
			format.js {}
			format.html 
		end
	end



	def comment_params
		params.require(:comment).permit(:content, :commentable, :commentable_id, :commentable_type)
	end
end
