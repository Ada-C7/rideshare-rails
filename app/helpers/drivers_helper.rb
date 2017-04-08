module DriversHelper

  def display_ave_rating

    return  "#{@driver.name.capitalize} has had no trips so far."  if @driver.ave_rating.nil?
    "Average rating: #{'%.2f' % @driver.ave_rating}"
  end

end
