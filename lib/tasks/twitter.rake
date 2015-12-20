namespace :twitter do
  desc "twitterに画像をupload"
  task :upload => :environment do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end

    gif = File.open('./image/gif/*.gif')
    client.update_with_media('gifテストてすと', gif)
  end
end
