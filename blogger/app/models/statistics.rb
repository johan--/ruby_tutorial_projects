class Statistics
  def total_articles
    Article.count
  end

  def total_comments
    Comment.count
  end
end
