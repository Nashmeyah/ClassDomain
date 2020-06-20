class Project < ApplicationRecord
  belongs_to :userscourse
  belongs_to :user

  validates :name, presence: true

  accepts_nested_attributes_for :userscourse, reject_if: :all_blank
end
