class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    @articles, @tag = Article.search_by_tag_name(params[:tag])
    @pages = Page.all
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' Created!"
      redirect_to article_path(@article)
    else 
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end
