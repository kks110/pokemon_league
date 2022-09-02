class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :winning_player_id
      t.integer :losing_player_id
      t.integer :winner_score
      t.integer :loser_score

      t.timestamps
    end
  end
end
