class Course < ApplicationRecord
    belongs_to :category
    has_many :userscourses

    # accepts_nested_attributes_for :category, reject_if: :all_blank
end
