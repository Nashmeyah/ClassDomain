class Userscourse < ApplicationRecord
    belongs_to :user
    belongs_to :course
    has_many :projects
end