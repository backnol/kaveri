class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
    render json: @cards
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:title, :origin, :posted_at, :user_id)
    end
end
