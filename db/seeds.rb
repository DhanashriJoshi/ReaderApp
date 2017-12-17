# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

[
  { title: 'MSN', url: 'http://rss.msn.com/en-in/', description: 'MSN' },
  { title: 'Ruby Language', url: 'http://www.ruby-lang.org/en/feeds/news.rss', description: 'Ruby Language' },
  { title: 'India Times', url: 'http://economictimes.indiatimes.com/rssfeeds/1058830.cms', description: 'Economic Times' },
  { title: 'TechCrunch - StartUps', url: 'http://feeds.feedburner.com/TechCrunch/startups', description: 'Start Ups' },
  { title: 'TechCrunch - LinkedIn', url: 'http://feeds.feedburner.com/TechCrunch/LinkedIn', description: 'LinkedIn' }
].each do |feed|
  Feed.find_or_create_by(feed)
end
ap 'Feeds added'
