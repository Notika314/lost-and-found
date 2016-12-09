require "http"
require "json"
class ItemsController < ApplicationController

	def show
		@current_user = User.find(session[:user_id])
	end

	def index 
		@items = Item.all
		@lost_items = Item.where(status: "lost").includes(:comments)
		@found_items = Item.where(status: "found").includes(:comments)
		if session[:user_id]
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
			redirect_to "/items"
		else 
		end
	end

	def item_params
		params.require(:item).permit(:name, :description, :location, :date, :status,:user_id)
	end

	def api
		if request.xhr?
			l = HTTP.get("http://www.omdbapi.com/?t=frozen&y=&plot=full&r=json")
			m = JSON.parse(l)
			@text = m
			render "_api_test", layout: false
		end
	end

end
