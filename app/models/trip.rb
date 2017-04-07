class Trip < ApplicationRecord
    belongs_to :driver, :class_name => Driver, :foreign_key => :driver_id
    belongs_to :rider
end
