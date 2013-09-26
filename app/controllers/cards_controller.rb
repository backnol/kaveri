class CardsController < ApplicationController
  respond_to :json

  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:title, :origin, :posted_at, :user_id)
    end
end
