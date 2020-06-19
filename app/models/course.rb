class Course < ApplicationRecord
    belongs_to :category
    has_many :projects
    has_many :users, through: :projects

    accepts_nested_attributes_for :category, reject_if: :all_blank
end
