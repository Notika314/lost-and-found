class Comment < ActiveRecord::Base
	belongs_to :item
	belongs_to :user
	has_many :replies, class_name: "Comment", foreign_key: :parent_id
	belongs_to :parent, class_name: "Comment", foreign_key: :parent_id, optional: true
end