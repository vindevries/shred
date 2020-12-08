class Language < ApplicationRecord
  has_many :instructors, through: :instructor_languages
end
