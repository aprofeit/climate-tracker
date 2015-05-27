class Measurement < ActiveRecord::Base
  TEMPERATURE_CALIBRATION = 4.3

  def temperature
    self[:temperature] - TEMPERATURE_CALIBRATION
  end
end
