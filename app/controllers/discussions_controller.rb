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

	def show 
		puts params.inspect
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussion = @comment.discussions.find(params[:id])
		@replies = @discussion.replies.sort_by{|m| m[:created_at]}
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussion = @comment.discussions.find(params[:id])
		@discussion.destroy

		redirect_to article_comment_discussions_path(@article, @comment, @discussion)
	end

	private
    def discussion_params
      params.require(:discussion).permit(:topic, :opPost, :userName)
    end
end
