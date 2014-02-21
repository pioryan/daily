class ExpensesController < ApplicationController
  before_filter :load_expenses
  def index

  end

  def new
    @expense = Expense.new
  end

  def create
    Expense.create(expense_params)
    redirect_to expenses_path
  end

  private

    def expense_params
      params.require(:expense).permit(:name, :cost)
    end

    def load_expenses
      @expenses = Expense.where(["created_at between ? and ?", Time.current.beginning_of_day, Time.current.end_of_day])
    end
end