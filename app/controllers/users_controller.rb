class UsersController < ApplicationController
  def cart
    @cart = Cart.all
  end

  def profile
    @user = current_user
  end
end
