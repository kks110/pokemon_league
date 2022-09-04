class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    player_params['favorite_pokemon'].downcase!
    fave_pokemon = player_params['favorite_pokemon']
    new_params = player_params.merge!({'favorite_pokemon_id' => get_pokemon_id(fave_pokemon)})
    @player = Player.new(new_params)

    if @player.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player_params['favorite_pokemon'].downcase!
    fave_pokemon = player_params['favorite_pokemon']
    new_params = player_params.merge!({'favorite_pokemon_id' => get_pokemon_id(fave_pokemon)})
    @player = Player.find(params[:id])

    if @player.update(new_params)
      redirect_to @player
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def get_pokemon_id(fave_pokemon)
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{fave_pokemon}")

    if "Not Found" == response.body
      1
    else
      response['id']
    end
  end

  def player_params
    params.require(:player).permit(:name, :favorite_pokemon)
  end
end
