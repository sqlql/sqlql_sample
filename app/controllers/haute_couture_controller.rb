class HauteCoutureController < ApplicationController
  before_action :authenticate

  def show
    query = haute_couture_params['query']
    HauteCouture.check_sql(query: query, user: @user)
    result = HauteCouture.find_by_sql(
      query: query,
      user: @user
    )
    render json: result
  end

  private

  def haute_couture_params
    params.require(:haute_couture).permit(:query)
  end
end
