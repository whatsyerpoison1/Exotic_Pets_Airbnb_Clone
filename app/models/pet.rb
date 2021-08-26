class Pet < ApplicationRecord
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :species, :description ],
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :species, presence: true
  validates :description, presence: true

end
