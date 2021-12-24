class Api::UsersController < Api::ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  # def cart
  #   @cart = Cart.all.limit(10)
  # end

  def profile
    @user = current_user
    @user ? head(:ok) : head(:unauthorized)
  end

  # def edit; end
end
