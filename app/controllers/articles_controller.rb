class ArticlesController < ApplicationController
  def index
    condition = {}
    if params[:feed_id].present?
      @feed = Feed.find_by_id(params[:feed_id])
      condition = {feed_id: @feed}
    end
    @articles = Article.where(condition).order('published_at DESC')
  end
end
