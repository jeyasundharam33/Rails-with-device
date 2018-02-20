class ArticlesController < ApplicationController
  
	
  http_basic_authenticate_with name: "sundhar", password: "jeya", except: [:index, :show]
	
  def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
      $flag="Your Article saved"
	else
      render 'new'
      $flag="Your Article Not saved"
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
		
      $flag="Your Article updated"
      redirect_to @article
    else
      $flag="Your Article Not updated"
   	 render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
	 $flag="Your Article deleted"
     
     redirect_to articles_path
	else
	 $flag="Your Article not deleted"
	end
		
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end