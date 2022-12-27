class Comment < ApplicationRecord
    belongs_to :discussion
    has_many :replies
end
