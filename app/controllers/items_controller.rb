require "http"
require "json"
class ItemsController < ApplicationController

	def keyword_search
		# Client.where("orders_count = ? AND locked = ?", params[:orders], false)
		p "in keyword search!!!"
		@keyword = params["keyword"]
		@items = Item.all
		@lost_items = Item.where("status = ? AND name LIKE ?", "lost", "%#{@keyword}%" ).includes(:comments)
		# @lost_items = Item.where(status: "lost").includes(:comments)
		@found_items = Item.where("status = ? AND name LIKE ?", "found" , "%#{@keyword}%").includes(:comments)
		# @found_items = Item.where(status: "found").includes(:comments)
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
		if request.xhr? 
			render json: { keyword: @keyword }.to_json
		else
			render "index"
		end
	end

	def api
		if request.xhr?
			l = HTTP.get("http://www.omdbapi.com/?t=frozen&y=&plot=full&r=json")
			m = JSON.parse(l)
			@text = m
			render "_api_test", layout: false
		end
	end

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


end
