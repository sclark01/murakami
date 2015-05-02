class DiscussionsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussion = @comment.discussions.create(discussion_params)
		puts @discussion.inspect
	end

	def new
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
	end

	private
    def discussion_params
      params.require(:discussion).permit(:topic, :opPost, :userName)
    end
end
