class CommentsController < ApplicationController
	def create

		@comment = Comment.new(comment_params())
		@comment.user = current_user
		if params[:commentable_type] == "Post"
			@comment.commentable = Post.find_by(:id, params[:commentable_id])
		elsif params[:commentable_type] == "Comment"
			@comment.commentable = Comment.find_by(:id, params[:commentable_id])
		end
		@comment.save()
		redirect_to request.referer
	end
	def render_comments 
 			render @post.comments 
	end



	private
	def comment_params
			params.require(:comment).permit(:content, :commentable, :commentable_id, :commentable_type)

	end
end
