class CreditRequestDocument < ApplicationRecord
  belongs_to :credit_request

  enum :document_type, {
    balance_sheet: "balance_sheet",
    income_statement: "income_statement",
    last_12_months_revenue: "last_12_months_revenue",
    cnpj_card: "cnpj_card",
    other: "other"
  }, prefix: true

  attribute :active, default: true

  validates :document_type, presence: true
  validates :file_name, presence: true
  validates :content_type, presence: true
  validates :file_size, presence: true, numericality: { greater_than: 0 }
end
