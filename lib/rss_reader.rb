class RssReader
  require 'net/http'
  require 'net/https'

  def initialize(url)
    @uri = URI.parse(url)
  end

  def parse
    begin
      doc = Nokogiri::XML(body)
      st = Hash.from_xml(doc.to_s)
      return true, st['rss']['channel']['item']
    rescue Exception => e
      return false, e.message
    end
  end

  def get_articles
    success, response = parse
    if success.present?
      response.map{|article|
        get_article(article)
      }
    else
      return []
    end
  end

  def get_article(article)
    {
      'description' => article['description'],
      'url' => article['link'],
      'title' => article['title'],
      'published_at' => article['pubDate'],
      'article_no' => article['guid'],
      'author' => article['author']
    }
  end

  def body
    response = Net::HTTP.get_response(@uri)
    response.body
  end
end
