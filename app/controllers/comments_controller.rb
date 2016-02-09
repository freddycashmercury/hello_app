class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
  end

  def index
    @comments = Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end

end
