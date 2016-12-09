class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		@item_id = params[:item_id]
	end
	def create
		p params
		p "in comments create !!!!!"
		comment = Comment.new(comment_params)
		if comment.save
			redirect_to "/items"
		else
			p comment_params
			p "could not save comment"
		end
	end
	def comment_params
		params.require(:comment).permit(:body, :item_id, :parent_id,:user_id)
	end
end
