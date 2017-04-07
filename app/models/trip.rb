class Trip < ApplicationRecord
  belongs_to :driver, :class_name => Driver, :foreign_key => :driver_id
  belongs_to :rider

  def my_link_to(user)
    no_name = trip.driver.name
    return "" if no_name.blank?
    link_to trip.driver.name, driver_path(trip.driver_id), :class => 'name'
  end
end
