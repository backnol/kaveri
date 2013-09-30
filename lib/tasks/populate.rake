require 'faker'

namespace :db do
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    50.times do
      origin = rand(Card::ORIGINS.size - 1)
      if Card::ORIGINS[origin] == :instagram
        image_url = 'http://distilleryimage11.ak.instagram.com/62daa12ad2c211e292fc22000a1f9806_7.jpg'
      else
        image_url = nil
      end
      card = Card.create!(title: Faker::Lorem.sentence(20),
                   link: Faker::Internet.url,
                   posted_at: Time.now - rand(1..20).hours,
                   origin: origin,
                   image_url: image_url)
      ap card
    end
  end
end