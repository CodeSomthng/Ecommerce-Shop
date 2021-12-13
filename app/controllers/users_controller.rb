class UsersController < ApplicationController
  before_action :authenticate_user!
  def cart
    @cart = Cart.all
  end

  def profile
    @user = current_user
  end

  def edit; end
end
