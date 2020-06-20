class Category < ApplicationRecord
    has_many :courses
    has_many :userscourses, through: :courses
    
    validates :name, presence: true
    validates :name, uniqueness: true
    
end
