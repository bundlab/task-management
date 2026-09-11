class Api::V1::ListsController < ApplicationController
  before_action :authenticate_user!

  def create
    @board = Board.find(params[:board_id])
    
    # Simple authorization
    unless @board.organization.owner_id == current_user.id
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end

    @list = @board.lists.new(list_params)

    if @list.save
      render json: @list, status: :created
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
