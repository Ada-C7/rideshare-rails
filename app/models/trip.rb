class Trip < ApplicationRecord
  belongs_to :driver, :foreign_key => "driver_id"
  belongs_to :user, :foreign_key => "user_id"

  validates :driver_id, exclusion: { in: [0] }, presence: true
  validates :user_id, exclusion: { in: [0] }, presence: true
  validate :rating, length: { in: 0..5 }, presence: true
end
