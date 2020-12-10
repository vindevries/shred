class Tag < ApplicationRecord
    has_many :instructor_tags, dependent: :destroy
    has_many :instructors, through: :instructor_tags
  end