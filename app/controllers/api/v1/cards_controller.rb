class Api::V1::CardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    
    unless @list.board.organization.owner_id == current_user.id
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end

    @card = @list.cards.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :description, :due_date, :assignee_id)
  end
end
