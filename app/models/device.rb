class Device < ActiveRecord::Base

  has_many :sensor_data

  # Validations
  validates :serial_number, :firmware, presence: true
  validates :serial_number, length: { is: 12 }
  validates :serial_number, uniqueness: true  # Also in the database by an unique constraint (index), to avoid race conditions

end
