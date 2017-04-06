class Rider < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true, format: {with: /\A[ a-zA-Z]+\z/, message: "only allows letters" }
  validates :phone_num, presence: true, uniqueness: true
end
