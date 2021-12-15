class CommentsController < ApplicationController
  def new; end

  def create
    @comment = Comments.new
  end

  def edit; end

  def update; end

  def destroy; end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :description, :price, :image)
  end
end
