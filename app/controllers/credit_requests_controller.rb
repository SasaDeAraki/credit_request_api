class CreditRequestsController < ApplicationController
  def index
    requests = CreditRequest.all

    render json: requests
  end

  def show
    set_request

    render json: @request
  end

  def create
    request = CreditRequest.create!(request_params)
    render json: request, status: :created
  end

  def update
    set_request

    @request = CreditRequest.update!(@request.id, request_params)
    render json: @request, status: :ok
  end

  def submit
    set_request

    @request.status_submitted!
    render json: @request
  end

  def start_review
    set_request

    @request.status_under_review!
    render json: @request
  end

  def approve
    set_request

    @request.status_approved!
    render json: @request
  end

  def reject
    set_request

    @request.status_rejected!
    render json: @request
  end

  def request_additional_documents
    set_request

    @request.status_additional_documents_requested!
    render json: @request
  end

  private

  def set_request
    @request = CreditRequest.find(params[:id])
  end

  def request_params
    permitted_params = params.permit(
      :customer,
      :request_amount,
    )
  end
end
