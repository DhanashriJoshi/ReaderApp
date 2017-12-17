class RssParser
  def initialize(url, feed_id)
    @url = url
    @feed_id = feed_id
  end

  def parse
    articles = RssReader.new(@url).get_articles
    articles = articles.map(&:with_indifferent_access)
    save(articles)
  end

  def save(articles)
    feed = Feed.find_by_id(@feed_id)
    articles.each{|f|
      feed.articles.build(to_article_obj(f)).save!
    }
  end

  def to_article_obj(o)
    {
      title: o[:title],
      url: o[:url],
      description: o[:description],
      published_at: o[:published_at],
      author: o[:author],
      article_no: o[:article_no]
    }
  end
end
