class CommentsController < ApplicationController
	def render_comments 
 			render @post.comments 
	end
end
