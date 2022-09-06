class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])

    if @match.update(match_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def match_params
    params.require(:match).permit(:winning_player_id, :losing_player_id, :winner_score, :loser_score)
  end
end
