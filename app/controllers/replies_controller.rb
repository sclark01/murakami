class RepliesController < ApplicationController
	def index
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussion = @comment.find(params[:discussion_id])
		@replies = @discussion.replies
	end
	def create 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:comment_id])
		@discussion = @comment.find(params[:discussion_id])
		@reply = @discussion.replies
		                    .create(reply_params)
	end
	private 
		def reply_params
			params.require(:reply)
			      .permit(:body, :userName)
		end
end
