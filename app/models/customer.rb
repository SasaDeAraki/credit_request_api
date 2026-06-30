class Customer < ApplicationRecord
  has_many :credit_requests, dependent: :destroy

  validates :name, presence: true
  validates :document, :email, presence: true, uniqueness: true
  attribute :active, :boolean, default: true

  scope :active, -> { where(active: true) }
end
