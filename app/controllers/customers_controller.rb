class CustomersController < ApplicationController
  def index
    customers = Customer.active

    render json: customers
  end

  def show
    set_customer

    render json: @customer, status: :ok
  end

  def create
    customer = Customer.create!(customer_params)
    render json: { id: customer.id }, status: :created
  end

  def update
    set_customer

    @customer = Customer.update!(@customer.id, customer_params)
    render json: @customer, status: :ok
  end

  def destroy
    set_customer

    @customer = Customer.update(@customer.id, active: false)
    render json: { id: @customer.id }
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    permitted_params = params.permit(
      :name,
      :document,
      :email,
    )
  end
end
