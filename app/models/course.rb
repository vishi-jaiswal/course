class Course < ApplicationRecord
	has_many :tutors
	validates :name, :description, presence: true
	accepts_nested_attributes_for :tutors
	validates_associated :tutors
end
