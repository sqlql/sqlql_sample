class LikesController < ApplicationController
  before_action :authenticate
  before_action :set_like, only: [:destroy]

  # POST /likes
  def create
    @like = Like.new(comment_id: params[:comment_id], user: @user)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end
end
