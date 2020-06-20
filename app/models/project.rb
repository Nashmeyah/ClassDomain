class Project < ApplicationRecord
  belongs_to :userscourse
  belongs_to :user

  accepts_nested_attributes_for :userscourse, reject_if: :all_blank
end
