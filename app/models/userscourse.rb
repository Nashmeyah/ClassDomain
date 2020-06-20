class Userscourse < ApplicationRecord
    belongs_to :user
    belongs_to :course
    has_many :projects

    accepts_nested_attributes_for :projects, reject_if: :all_blank
end
