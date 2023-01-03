FactoryBot.define do 
    factory :discussion  do 
      sequence(:title) { |n| "title#{n}"}
      sequence(:content) { |n| "content#{n}"}
      sequence(:likes) { |n| n}
      sequence(:name) { |n| "name#{n}"}
      sequence(:image) { |n| "image#{n}"}
      sequence(:pinned) { |n| true}
    end 
end 