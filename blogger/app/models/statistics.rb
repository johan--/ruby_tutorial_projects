class Statistics
  def total_articles
    Article.count
  end

  def total_comments
    Comment.count
  end

  def most_popular
    Article.all.sort_by { |article| article.comments.count }.last
  end
end
