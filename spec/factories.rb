FactoryGirl.define do
  factory :card do
    user
    title 'This title is is the bomb'
    link 'http://www.google.com'
    origin 0
    posted_at Time.now
    image_url 'http://distilleryimage11.ak.instagram.com/62daa12ad2c211e292fc22000a1f9806_7.jpg'
  end
  
  factory :user do
    sequence(:email) { |n| "user#{n}@backnol.com" }
    password 'password'
    password_confirmation 'password'
  end
end