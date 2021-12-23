class Api::Admin::UsersController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin_user!

  def index
    @user = User.all.limit(10)
    render :index, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render :show, status: :ok
    # localhost:3000/categories/:id get
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    if @user.destroy!
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  # def users_list
  #   # @users = User.all.limit(10)
  #   @users = User.where.not(id: current_user.id).limit(10)
  # end

  # def ban
  #   @user = User.find(params[:id])
  #   @user.update!(banned_users: true)
  #
  #   flash[:alert] = 'User was banned'
  #   flash[:notice] = 'User was banned'
  # end

  def authenticate_admin_user!
    # authentication related logic goes here
    redirect_to root_url unless current_user.try(:admin?)
  end
end
