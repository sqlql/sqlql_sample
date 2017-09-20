class UsersController < ApplicationController
  def create
    user = User.new(user_param)

    if user.save
      render json: { key: user.key }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_param
    params.require(:user).permit(:name, :privacy)
  end
end
