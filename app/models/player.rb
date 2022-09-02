class Player < ApplicationRecord
  field :name, type: String

  validates :name, presence: true
  validates :name, uniqueness: true
end
