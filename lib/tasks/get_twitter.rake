namespace :social do
  task get_twitter: :environment do
    tweets = TWITTER.user_timeline('backnol')
    tweets.each do |tweet|
      attributes = tweet.attrs
      text = attributes[:text]
      id = attributes[:id]
      created_at = attributes[:created_at]
      Card.create!(title: text, originated_network: :twitter, posted_at: created_at)
    end
  end
end