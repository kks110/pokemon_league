class WinnerLooserUniqueness < ActiveModel::Validator
  def validate(record)
    if record.winning_player_id == record.losing_player_id
      record.errors.add :winning_player_id, "and Loosing player cannot be the same"
    end
  end
end

class Match < ApplicationRecord
  validates :winning_player_id, :losing_player_id, :winner_score, :loser_score, presence: true
  validates_with WinnerLooserUniqueness

  def winner
    Player.find(winning_player_id)
  end

  def loser
    Player.find(losing_player_id)
  end
end
