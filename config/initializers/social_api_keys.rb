# Copy keys/social_apis_template.yml to keys/social_apis_template.yml and fill the keys
social_api_keys = HashWithIndifferentAccess.new(YAML::load(File.open('keys/social_apis.yml')))
twitter_key = social_api_keys[:twitter]
TWITTER = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_key[:consumer_key]
  config.consumer_secret     = twitter_key[:consumer_secret]
  config.access_token        = twitter_key[:access_token]
  config.access_token_secret = twitter_key[:access_token_secret]
end

twitter_key = social_api_keys[:instagram]
INSTAGRAM = Instagram.configure do |config|
  config.client_id = twitter_key[:client_id]
  config.access_token = twitter_key[:access_token]
end