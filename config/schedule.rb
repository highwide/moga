set :output, 'log/crontab.log'
set :environment, :production

every 1.day, :at => "10:00 am" do
  rake "picture:take"
end

every 1.day :at => "10:30 am" do
  rake "gif:create"
end

every 1.day, :at => "11:00 am" do
  rake "twitter:upload"
end
