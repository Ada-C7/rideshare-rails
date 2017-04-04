class Rider < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness:true

  validates :phone_num, presence: true
end
