class Api::V1::BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.organizations.flat_map(&:boards)
    render json: @boards
  end

  def create
    @board = Board.new(board_params)
    @board.organization_id = params[:organization_id]

    if @board.save
      render json: @board, status: :created
    else
      render json: { errors: @board.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :description)
  end
end
