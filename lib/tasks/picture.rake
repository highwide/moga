namespace :picture do
  desc "Ras Piから写真を撮影する"
  task :take => :environment do
    `raspistill -o image/jpg/#{DateTime.now.strftime('%Y%m%d%H%M%S')}.jpg`
  end
end
