json.array!(@cards) do |card|
  json.extract! card, :title, :origin, :posted_at, :user_id, :link
  json.url card_url(card, format: :json)
end
