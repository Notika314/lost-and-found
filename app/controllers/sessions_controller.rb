class SessionsController < ApplicationController
	def logout
		session[:user_id] = nil
		redirect_to "/"
	end
	def login
		@current_user = User.find_by(username: params[:user][:username])
		session[:user_id]=@current_user.id
		if @current_user
			redirect_to "/items/show"
		else 
			redirect_to "/"
		end
	end
end
