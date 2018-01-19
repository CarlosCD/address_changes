class SensorDatum < ActiveRecord::Base

  belongs_to :device

  # To be able to set the crteated{_at form the API:
  # attr_accessible :created_at

  # Validations
  validates :temperature, :co_level, :air_humidity, :device_health, presence: true
  validates :co_level, :air_humidity, numericality: { greater_than_or_equal_to: 0 }

  before_create :set_co_alert, if: ->(data) { data.co_level > 9 }

  private

  def set_co_alert
    self.co_alert = true
  end

end
