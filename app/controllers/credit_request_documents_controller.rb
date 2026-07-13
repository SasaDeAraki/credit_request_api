class CreditRequestDocumentsController < ApplicationController
  def index
    documents = CreditRequestDocument.all

    render json: documents
  end

  def create
    document = CreditRequestDocument.create!(document_params)

    render json: document, status: :created
  end

  def destroy
    set_document

    @document = CreditRequestDocument.update!(@document.id, active: false)
    render json: { id: @document.id }
  end

  private

  def set_document
    @document = CreditRequestDocument.find(params[:credit_request_id])
  end

  def document_params
    params.permit(
      :credit_request_id,
      :document_type,
      :file_name,
      :content_type,
      :file_size,
      :uploaded_at
    )
  end
end
