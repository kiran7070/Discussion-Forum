FactoryBot.define do 
    factory :reply  do 
      sequence(:username) { |n| "comment#{n}"}
      sequence(:reply) { |n| "this is good article"}
      
    end 
end 