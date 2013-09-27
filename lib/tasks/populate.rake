require 'faker'

namespace :db do
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    50.times do
      card = Card.create!(title: Faker::Lorem.sentence(20),
                   link: Faker::Internet.url,
                   posted_at: Time.now - rand(1..20).hours,
                   origin: rand(Card::ORIGINS.size - 1))
      ap card
    end
  end
end