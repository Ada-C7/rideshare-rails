class Trip < ApplicationRecord
  belongs_to :rider, :driver
end
