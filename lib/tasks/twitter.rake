namespace :twitter do
  desc "twitterに画像をupload"
  task :upload => :environment do
    date = DateTime.now.strftime('%Y%m%d')
    file = File.open(Dir.glob("./image/jpg/#{date}*.jpg").first)
    message = "@highwide #{DateTime.now.strftime('%Y年%m月%d日の様子です。')}"
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
      client.update_with_media(message, img)
    rescue
    end
  end
end
