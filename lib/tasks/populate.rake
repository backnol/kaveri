require 'faker'

namespace :db do
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    20.times do
      Card.create!(title: Faker::Lorem.characters,
                   url: Faker::Internet.url,
                   posted_at: Time.now - rand(1..20).hours)
    end
  end
end