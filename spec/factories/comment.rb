FactoryBot.define do 
    factory :comment  do 
      #association :discussion
      sequence(:username) { |n| "comment#{n}"}
      sequence(:comment) { |n| "this is good article"}
      sequence(:discussion_id) {1}
      
    end 
end 