FactoryGirl.define do
  factory :card do
    user
    title 'This title is is the bomb'
    origin 0
    posted_at Time.now
    embed_html "<h2>Hey Hey Hey! H2 in da house</h2>"
  end
  
  factory :user do
    sequence(:email) { |n| "user#{n}@backnol.com" }
    password 'password'
    password_confirmation 'password'
  end
end