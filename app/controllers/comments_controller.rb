class CommentsController < ApplicationController
  before_action :authenticate
  before_action :set_comment, only: [:update, :destroy]

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = @user

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    unless @comment.user == @user
      render json: { message: 'おまえのじゃない' }, status: :unauthorized
    end

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    unless @comment.user == @user
      render json: { message: 'おまえのじゃない' }, status: :unauthorized
    else
      @comment.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :privacy)
    end
end
