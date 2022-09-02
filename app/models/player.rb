class Player < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  def matches
    Match.where((["winning_player_id = ? or losing_player_id = ?", "#{id}", "#{id}"]))
  end
  def wins_and_losses
    wins_and_losses_hash = {
      matches_won: 0,
      matches_lost: 0,
      games_won: 0,
      games_lost: 0,
    }
    matches.each do |match|
      if match.winning_player_id == id
        wins_and_losses_hash[:matches_won] += 1
        wins_and_losses_hash[:games_won] += match.winner_score
        wins_and_losses_hash[:games_lost] += match.loser_score
      else
        wins_and_losses_hash[:matches_lost] += 1
        wins_and_losses_hash[:games_won] += match.loser_score
        wins_and_losses_hash[:games_lost] += match.winner_score
      end
    end
    wins_and_losses_hash
  end
end
