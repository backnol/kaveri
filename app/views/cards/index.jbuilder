json.array!(@cards) do |card|
  json.extract! card, :id, :title, :originated_network, :posted_at, :user_id, :embed_html
  json.url card_url(card, format: :json)
end
