class User < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, uniqueness: true, presence: true
end
