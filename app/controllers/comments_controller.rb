class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params())
		@comment.user = current_user
		if params[:post_id]
			@comment.commentable = Post.find_by(:id, params[:post_id])
		elsif params[:comment_id]
			@comment.commentable = Comment.find_by(:id, params[:comment_id])
		end
		@comment.save()
		redirect_to request.referer
	end
	def render_comments 
 			render @post.comments 
	end



	private
	def comment_params
		params.require(:comment).permit(:content, :commentable, :commentable_id, :post_id, :comment_id)
	end
end
