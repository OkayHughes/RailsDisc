module PostsHelper

	def post_reply_path(post)
		"/posts/reply/#{post.id}"
	end

	def get_groups(post)
		post.group.split
	end
end
