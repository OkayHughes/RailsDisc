class SessionsController < ApplicationController
	def index
	end
	
	def destroy
		sign_out
		redirect_to root_url
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to posts_path	
		else
			flash[:error] = "Invalid password/email"
			render :index
		end
	end
end
