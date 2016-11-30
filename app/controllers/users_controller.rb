class UsersController < ApplicationController

	def create 
		if params[:user][:password] == params[:user]["confirm password"]
			@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to "/items/show"
				# redirect_to "/"
			else
				redirect_to "/"
			end
		end
	end
	def user_params
		params.require(:user).permit(:username, :password, :phone, :email)
	end
end
