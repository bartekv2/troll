class Theft < ApplicationRecord
  belongs_to :user
  validates :exact_time_of_previous, uniqueness: true
  validates :answer, numericality: true
end
