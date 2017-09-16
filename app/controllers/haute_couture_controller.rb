class HauteCoutureController < ApplicationController
  before_action :authenticate

  def show
    result = HauteCouture.find_by_sql(
      query: haute_couture_params['query'],
      user: @user
    )
    render json: result
  end

  private

  def haute_couture_params
    params.require(:haute_couture).permit(:query)
  end
end
