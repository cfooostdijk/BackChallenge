class UsersController < ApplicationController
  load_and_authorize_resource class: "User"

  def index
    users = User.all
    render json: @users, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: @users, status: :ok
    else
      render json: "error", status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    permits  = Ability.new(user).list_of_permits
    render json: {user: user, permits: permits}, status: :ok
  end

  private
  def user_params
    params.permit(:email, :password, :role_id)
  end
end
