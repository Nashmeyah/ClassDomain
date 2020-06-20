class Course < ApplicationRecord
    belongs_to :category
    has_many :userscourses
    has_many :projects, through: :userscourses

    validates :name, uniqueness: true
    validates :name, :description, presence: true

    accepts_nested_attributes_for :category
end
