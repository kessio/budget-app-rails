class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /expenses or /expenses.json
  def index
    @group = Group.includes(:expenses).find(params[:group_id])
    @expenses = @group.latest_expenses
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @group = Group.find(params[:group_id])
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @group = Group.find(params[:group_id])
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        category_expense = GroupExpense.new(group_id: params[:group_id], expense_id: @expense.id)
        category_expense.save
        format.html { redirect_to group_expenses_url(@expense), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to group_expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :group_id).merge(author_id: current_user.id)
  end
end
