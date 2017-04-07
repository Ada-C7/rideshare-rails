class Trip < ApplicationRecord
  belongs_to :passenger, optional: true
end
