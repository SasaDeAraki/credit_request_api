class Customer < ApplicationRecord
  validates :name, uniqueness: true
  validates :document, :email, presence: true, uniqueness: true
  attribute :active, :boolean, default: true
end
