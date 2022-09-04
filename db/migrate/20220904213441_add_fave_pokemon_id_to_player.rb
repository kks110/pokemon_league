class AddFavePokemonIdToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :favorite_pokemon_id, :integer
  end
end
