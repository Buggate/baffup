class OperatorsController < ApplicationController

	layout 'admin'

  before_action :confirm_logged_in

  def index
    @operators = Operator.sorted
  end

  def new
    @operator = Operator.new
  end

  def create
    @operator = Operator.new(operator_params)
    if @operator.save
      flash[:notice] = 'Operator created successfully.'
      redirect_to(operators_path)
    else
      render('new')
    end
  end

  def edit
    @operator = Operator.find(params[:id])
  end

  def update
    @operator = Operator.find(params[:id])
    if @operator.update_attributes(operator_params)
      flash[:notice] = 'Operator updated successfully.'
      redirect_to(operators_path)
    else
      render('edit')
    end
  end

  def delete
    @operator = Operator.find(params[:id])
  end

  def destroy
    @operator = Operator.find(params[:id])
    @operator.destroy
    flash[:notice] = "Operator destroyed successfully."
    redirect_to(operators_path)
  end

  private

  def operator_params
    # Permit :password, but NOT :password_digest
    params.require(:operator).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password
    )
  end
end
