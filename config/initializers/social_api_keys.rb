social_api_keys = HashWithIndifferentAccess.new(YAML::load(File.open('keys/social_apis.yml')))
twitter_key = social_api_keys[:twitter]
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_key[:consumer_key]
  config.consumer_secret     = twitter_key[:consumer_secret]
  config.access_token        = twitter_key[:access_token]
  config.access_token_secret = twitter_key[:access_token_secret]
end