class Course < ApplicationRecord
    belongs_to :category
    accepts_nested_attributes_for :category, reject_if: :all_blank
end
