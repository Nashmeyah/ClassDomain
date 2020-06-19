class Category < ApplicationRecord
    has_many :courses
    has_many :userscourses, through: :courses
    
end
