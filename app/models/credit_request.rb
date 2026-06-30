class CreditRequest < ApplicationRecord
  belongs_to :customer

  enum :status, {
    draft: "draft",
    submitted: "submitted",
    under_review: "under_review",
    approved: "approved",
    rejected: "rejected",
    additional_documents_requested: "additional_documents_requested"
  }

  ACTIVE_STATUSES = %w[draft submitted under_review].freeze

  validates :requested_amount, numericality: { greater_than: 0 }
  validates :status, presence: :true, default: :draft

  validate :only_one_active_request_per_customer, if: :active_status?

  private

  def active_status
    status.in?(ACTIVE_STATUSES)
  end

  def only_one_active_request_per_customer
    active_db_values = self.class.statuses.slice(*ACTIVE_STATUSES).instance_values

    conflict_exists = CreditRequest
      .where(customer_id: customer_id, status: active_db_values)
      .where.not(id: id)
      .exists?

    if conflict_exists
      errors.add(:status, "já existe uma solicitação atia para este customer")
    end
  end
end
