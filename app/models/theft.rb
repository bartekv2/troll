class Theft < ApplicationRecord
  belongs_to :user
  has_many :cakes
  validates :exact_time_of_previous, uniqueness: true
end
