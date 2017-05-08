class Comment < ApplicationRecord


	  belongs_to :visitor, optional: true

	  belongs_to :party, optional: true

	  belongs_to :parent,  class_name: "Comment", optional: true

	  has_many   :replies, class_name: "Comment", foreign_key: :parent_id
	
end


