class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :year, presence: true, numericality: {greater_than: 1920}
  validates :mileage, presence: true
  validates :manufacturer_id, presence: true
end
