namespace :social do
  task get_instagram: :environment do
    last_card = Card.where(origin: Card::ORIGINS.index(:instagram)).order('posted_at ASC').last
    
    instas = Instagram.user_recent_media(52220899)
    ap instas.size
    instas.each do |insta|
      created_time = Time.strptime(insta[:created_time], '%s')       
      if last_card.nil? || created_time > last_card.posted_at
        if insta[:caption]
          text = insta[:caption][:text]
          id = insta[:id].split('_')[0]
          # image_url = insta[:images][:low_resolution][:url] 
          # embed_html = "<img src=\"#{image_url}\">"
  
          link = insta[:link].sub('http:','') + "embed"
          embed_html = link
          
          Card.create!(title: text,
                       originated_network: :instagram,
                       posted_at: created_time,
                       embed_html: embed_html,
                       remote_id: id)
        end
      end
    end
  end
end