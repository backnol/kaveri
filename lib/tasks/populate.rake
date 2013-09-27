require 'faker'

namespace :db do
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    20.times do
      Card.create!(title: Faker::Lorem.sentence,
                   link: Faker::Internet.url,
                   posted_at: Time.now - rand(1..20).hours,
                   origin: rand(Card::ORIGINS.size - 1))
    end
  end
end