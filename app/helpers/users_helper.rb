module UsersHelper
	def gravatar_for(options = {})
		gravatar_id = "00000000000000000000000000000000"
		size = 80
		name = "anonymous"
		c = ""

		if options[:user]
			name = options[:user].name
		end
		if options[:size]
			size = options[:size]
		end
		if options[:user] != nil
			gravatar_id = Digest::MD5::hexdigest(options[:user].email.downcase)
		end
		if options[:class]
			c = options[:class]
		end
		
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
		image_tag(gravatar_url, alt: name, class: c)
	end
end
