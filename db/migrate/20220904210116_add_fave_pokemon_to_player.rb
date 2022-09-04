class AddFavePokemonToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :favorite_pokemon, :string
  end
end
