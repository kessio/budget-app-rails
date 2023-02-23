class ExpensesController < ApplicationController
  #before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses or /expenses.json
  def index
    @group_expenses = Expense.all
  end

  # GET /expenses/1 or /expenses/1.json
  def show
     @group_expense = Expense.find(params[:id])
  end

  # GET /expenses/new
  def new
    @group_expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    @group_expense = Expense.new(expense_params)

    respond_to do |format|
      if @group_expense.save
        format.html { redirect_to group_expenses_url(@group_expense), notice: "Expense was successfully created." }
        format.json { render :show, status: :created, location: @group_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @group_expense.destroy

    respond_to do |format|
      format.html { redirect_to group_expenses_url, notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :amount, :group_id).merge(author_id: current_user.id)
    end
end
