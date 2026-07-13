class CreateCreditRequestDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :credit_request_documents do |t|
      t.references :credit_request, null: false, foreign_key: true
      t.string :document_type
      t.string :file_name
      t.string :content_type
      t.float :file_size
      t.date :uploaded_at
      t.boolean :active

      t.timestamps
    end
  end
end
