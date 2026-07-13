# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_07_09_221254) do
  create_table "credit_request_documents", force: :cascade do |t|
    t.boolean "active"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.integer "credit_request_id", null: false
    t.string "document_type"
    t.string "file_name"
    t.float "file_size"
    t.datetime "updated_at", null: false
    t.date "uploaded_at"
    t.index ["credit_request_id"], name: "index_credit_request_documents_on_credit_request_id"
  end

  create_table "credit_requests", force: :cascade do |t|
    t.string "analysis_comment"
    t.date "analyzed_at"
    t.datetime "created_at", null: false
    t.integer "customer_id", null: false
    t.float "request_amount"
    t.string "status"
    t.date "submitted_at"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_credit_requests_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "document"
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "credit_request_documents", "credit_requests"
  add_foreign_key "credit_requests", "customers"
end
