class Pouch < ApplicationRecord

		belongs_to :user

		has_many :friends

		has_many :friend_notices

end
