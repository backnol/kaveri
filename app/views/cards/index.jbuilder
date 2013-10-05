json.array!(@cards) do |card|
  json.extract! card, :id, :title, :originated_network, :posted_at, :user_id, :link, :image_url
  json.url card_url(card, format: :json)
end
