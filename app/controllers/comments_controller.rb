class CommentsController < ApplicationController
  before_action :authorize, only: :index
  USERS = { 'freddycashmercury' => 'heyguys!' }

  def new
    @comment = Comment.new
  end

  def create
    if @comment = Comment.create(comment_params)
      flash[:notice] = "Comment submitted!"
      redirect_to root_path
    else 
      flash[:notice] = "Comment failed to submit!"
      redirect_to new_comment_path
    end
  end

  def index
    @comments = Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end

  def authorize
    authenticate_or_request_with_http_digest do |username|
      USERS['freddycashmercury']
    end
  end

end
