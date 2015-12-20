namespace :gif do
  desc "jpgからgifを作成"
  task :create => :environment do
    jpgs = Dir.glob('./image/jpg/*.jpg')

    imgs = Magick::ImageList.new
    # TODO: rotateする必要あるか確認
    jpgs.each { |i| imgs << Magick::Image.read(i).first.rotate(90) }
     
    imgs.map! { |i| i.resize(0.2) }
     
    imgs.delay = 15
    imgs.write ("./image/gif/#{DateTime.now.strftime('%Y%m%d%H%M%S')}.gif")
     
    imgs.destroy!
  end
end
