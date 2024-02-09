class Tutor < ApplicationRecord
  belongs_to :course, optional: true
  validates :name, :experience, presence: true
end
