class SensorDatum < ActiveRecord::Base

  belongs_to :device

  before_create :set_co_alert, if: ->(data) { data.co_level > 9 }

  private

  def set_co_alert
    self.co_alert = true
  end

end
