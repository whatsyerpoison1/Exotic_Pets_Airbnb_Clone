class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :species, presence: true
  validates :description, presence: true
  has_many_attached :photos

end
