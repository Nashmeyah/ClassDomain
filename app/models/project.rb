class Project < ApplicationRecord
  belongs_to :userscourse
  belongs_to :user

  validates :name, presence: true

  scope :by_date, -> { order('created_at DESC, id DESC') }

  accepts_nested_attributes_for :userscourse, reject_if: :all_blank
end
