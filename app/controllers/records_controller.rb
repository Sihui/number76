class RecordsController < ApplicationController
  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to @record
    else
      render 'edit'
    end
  end

  private
    def record_params
      params.require(:record).permit(:current_moto_ele_count, :current_ele_count, :current_water_count, :pre_moto_ele_count, :pre_ele_count, :pre_water_count)
    end
end
