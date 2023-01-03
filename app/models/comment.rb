class Comment < ApplicationRecord
    belongs_to :discussion , optional:true
    has_many :replies
end
