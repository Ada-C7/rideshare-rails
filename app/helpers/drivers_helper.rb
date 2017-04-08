module DriversHelper

  def display_ave_rating
    return  "#{@driver.name} has not yet been rated"  if @driver.ave_rating.nil?
    '%.2f' % @driver.ave_rating
  end

end
