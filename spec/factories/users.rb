FactoryGirl.define do
  factory :user do
    username 'ShortRound'
    sequence(:email) { |n| "email#{n}@shanghai.com" }
    password 'chauffeur'
  end
end
