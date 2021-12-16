class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params.merge({ user_id: current_user.id,
                                                               product_id: params[:product_id] }))

    redirect_to category_product_path(params[:category_id], @product)
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @category = Product.find(@comment.product_id).category_id
    redirect_to category_product_path(@category, params[:product_id]) if @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!

    redirect_to category_product_path(params[:category_id], params[:product_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title)
  end
end
