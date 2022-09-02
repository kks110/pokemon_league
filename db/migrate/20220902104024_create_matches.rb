class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :winning_player_id
      t.integer :loosing_player_id
      t.integer :winner_score
      t.integer :loser_score

      t.timestamps

      t.index [:winning_player_id, :loosing_player_id], unique: true
    end
  end
end
