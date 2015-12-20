namespace :twitter do
  desc "twitterに画像をupload"
  task :jpg => :environment do
    date = DateTime.now.strftime('%Y%m%d')
    file = File.open("./image/jpg/#{date}*.jpg")
    message = DateTime.now.strftime('%Y年%m月%日の様子です')
    upload(file, message)
  end

  private

  def upload(file, message)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end

    begin
      img = File.open(file)
      binding.pry
      client.update_with_media(message, img)
    rescue
    end
  end
end
