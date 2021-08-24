class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true
  validates :description, presence: true
end
