module UsersHelper
	def gravatar_for(user, px = 80)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{px}"
		image_tag(gravatar_url, alt:user.name)
	end
end
