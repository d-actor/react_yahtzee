class Score < ApplicationRecord
  belongs_to :user

  # validations
  validates_presence_of :value
  validates_numericality_of :value
end
