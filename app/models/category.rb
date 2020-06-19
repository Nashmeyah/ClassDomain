class Category < ApplicationRecord
    has_many :courses
    has_many :projects, through: :courses

    
end
