class HauteCoutureController < ApplicationController
  before_action :authenticate

  def show
    query = haute_couture_params['query']
    query_string = HauteCouture.sql(query: query, user: @user)
    HauteCouture.check_sql(query_string)
    result = HauteCouture.find_by_sql(query_string)
    render json: result
  end

  private

  def haute_couture_params
    params.require(:haute_couture).permit(:query)
  end
end
