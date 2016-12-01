class SessionsController < ApplicationController
	def logout
		session[:user_id] = nil
		redirect_to "/"
	end
	def login
			user = User.find_by(username: params[:user][:username])
		if (user && user.authenticate(params[:user][:password]))
			@current_user = user
			session[:user_id]=@current_user.id
			redirect_to "/items/index"

		else 
			redirect_to "/"
		end
	end
end
