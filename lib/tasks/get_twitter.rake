namespace :social do
  task get_twitter: :environment do
    last_card = Card.where(origin: Card::ORIGINS.index(:twitter)).order('posted_at ASC').last
    
    tweets = TWITTER.user_timeline('backnol')
    tweets.each do |tweet|
      attributes = tweet.attrs
      created_at = Time.parse(attributes[:created_at])
      
      if last_card.nil? || created_at > last_card.posted_at
        text = attributes[:text]
        id = attributes[:id]
        
        embed_uri = URI("https://api.twitter.com/1/statuses/oembed.json?id=#{id}")
        embed_response = Net::HTTP.get(embed_uri)
        embed_html = JSON.parse(embed_response)['html']
        Card.create!(title: text,
                     originated_network: :twitter,
                     posted_at: created_at,
                     embed_html: embed_html,
                     remote_id: id)
      end
    end
  end
end