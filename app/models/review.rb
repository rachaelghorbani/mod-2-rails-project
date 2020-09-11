class Review < ApplicationRecord
belongs_to :player
belongs_to :court

validates :review, :rating, :player_id, :court_id, presence: true
end
