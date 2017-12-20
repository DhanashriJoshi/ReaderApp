class Fetcher
  def self.fetch_all_feeds
    Feed.all.each do |feed|
      RssParser.new(feed.url, feed.id).parse
    end

    Fetcher.delay(:run_at => Time.now + 1.day).fetch_all_feeds
  end
end
