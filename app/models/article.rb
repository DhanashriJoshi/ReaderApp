class Article < ActiveRecord::Base
  belongs_to :feed
  validates :article_no, :uniqueness => {:scope => :feed_id, allow_nil: true}
end
