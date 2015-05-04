class DiscussionsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussion = @comment.discussions.create(discussion_params)
		@discussions = @comment.discussions
		redirect_to article_comment_discussions_path(@article, @comment, @discussion)
	end

	def new
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
	end
	
	def index 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussions = @comment.discussions
	end
	private
    def discussion_params
      params.require(:discussion).permit(:topic, :opPost, :userName)
    end
end
