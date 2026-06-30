class CreateCreditRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :credit_requests do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :request_amount
      t.string :status
      t.string :analysis_comment
      t.date :submitted_at
      t.date :analyzed_at

      t.timestamps
    end
  end
end
