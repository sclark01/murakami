class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments
		                   .create(comment_params)
		redirect_to article_path(@article, :page => @comment.pageNum)
	end

	def destroy 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment)
			      .permit(:name, :desc, :pageNum)
		end
end
