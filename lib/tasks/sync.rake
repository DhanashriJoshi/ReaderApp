namespace :sync do
  task feeds: [:environment] do
    Feed.all.each do |feed|
      RssParser.new(feed.url, feed.id).delay.parse
    end
  end
end
