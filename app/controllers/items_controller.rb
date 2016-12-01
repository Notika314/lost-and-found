class ItemsController < ApplicationController
	def show
		@current_user = User.find(session[:user_id])
	end
	def index 
		@items = Item.all
		if session[:usr_id]
			@current_user = User.find(session[:user_id])
		end
	end
	def destroy
		item = Item.find_by(id: params[:item][:id].to_i)
	  item.destroy 
	  redirect_to "/"
	end
	def create 
		item = Item.new(item_params)
		if item_params[:name] == ""
			redirect_to "/"
		elsif item.save
			redirect_to "/items/index"
		end
	end


	def item_params
		params.require(:item).permit(:name, :description, :location, :date, :status,:user_id)
	end
end
