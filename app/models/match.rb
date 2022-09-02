class Match < ApplicationRecord
  field :winning_player_id, type: Integer
  field :loosing_player_id, type: Integer
  field :winner_score, type: Integer
  field :loser_score, type: Integer

  validates :winning_player_id, :loosing_player_id, :winner_score, :loser_score, presence: true
  validates :winning_player_id, uniqueness: { scope: :loosing_player_id}
end