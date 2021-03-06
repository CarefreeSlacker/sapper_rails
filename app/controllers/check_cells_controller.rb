class CheckCellsController < ApplicationController
  before_action :initialize_cell, :initialize_checker

  def create
    @attemption_checker.perform
    respond_to do |format|
      format.json { render json: @attemption_checker.result }
    end
  end

  def edit
  end

  private

  def initialize_cell
    @cell = Cell.find_by(id: params[:id])
  end

  def initialize_checker
    @attemption_checker = AttemptionChecker.new(cell: @cell)
  end
end
