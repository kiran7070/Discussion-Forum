class Reply < ApplicationRecord
    belongs_to :comment , optional:true
end
