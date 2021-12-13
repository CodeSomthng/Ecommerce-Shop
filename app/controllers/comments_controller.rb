class CommentsController < ApplicationController
  def create
    @comment = Comments.new
  end
end
