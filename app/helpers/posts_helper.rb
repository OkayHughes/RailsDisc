module PostsHelper

	def post_reply_path(post)
		"/posts/reply/#{post.id}"
	end
end
