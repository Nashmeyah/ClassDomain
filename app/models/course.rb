class Course < ApplicationRecord
    belongs_to :category
    has_many :projects
    has_many :users, through: :projects
end
