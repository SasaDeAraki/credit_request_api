class Customer < ApplicationRecord
  validates :name, presence: true
  validates :document, :email, presence: true, uniqueness: true
  attribute :active, :boolean, default: true

  scope :active, -> { where(active: true) }
end
