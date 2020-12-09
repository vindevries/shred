class Language < ApplicationRecord
  has_many :instructors, through: :instructor_languages
  has_many :instructor_languages, dependent: :destroy
end
