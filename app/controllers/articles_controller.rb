class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update 
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@userPage = params[:page].to_i
		@article = Article.find(params[:id])
		@commentsToShow = []
		for comment in @article.comments 
			if comment.pageNum != nil and comment.pageNum <= @userPage
				@commentsToShow.push(comment)
			end
		end
		@commentsToShow = @commentsToShow.sort_by {|c| -c[:pageNum]}
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :author)
		end
end
