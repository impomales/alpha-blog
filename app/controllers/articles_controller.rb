class ArticlesController < ApplicationController

  def new
    # creates a new article, not yet saved.
    @article = Article.new
  end

  def create
    # see params on page.
    # render plain: params[:article].inspect

    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
