class UsersController < ApplicationController
  before_action :authenticate_user!

  # def cart
  #   @cart = Cart.all.limit(10)
  # end

  def profile
    @user = current_user
  end

  def edit; end
end
