class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.create!(date:Date.today)
    get_room_data
    render "edit"
  end

  def edit
    @receipt = Receipt.find(params[:id])
    get_room_data
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy!
    redirect_to receipts_path
  end

  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update_attributes(receipt_params)
      redirect_to @receipt
    else
      render 'index'
    end
  end

  def print
    @receipt = Receipt.find(params[:id])
    @print_month = @receipt.date.month
    @print_year = @receipt.date.month < 12 ? @receipt.date.year : @receipt.date.year + 1
    @print_month = @receipt.date.month < 12 ? @receipt.date.month + 1 : 1
  end

  private
    def get_room_data
      @room_data = {}
      Room.all.each do |room|
        @room_data[room.number] = {
          tenant_path: room.admin_tenant ? edit_tenant_path(room.admin_tenant) : new_tenant_path,
          tenant_path_name: room.admin_tenant ? '修改房客资料' : '新建房客',
          admin_tenant: room.admin_tenant,
          rent: room.rent,
        }
      end
    end

    def receipt_params
      params.require(:receipt).permit(
        records_attributes: [:id, :pre_moto_ele_count, :current_moto_ele_count, :pre_ele_count, :current_ele_count, :pre_water_count, :current_water_count, :internet_fee, :cleaning_fee, :tv_fee],
        water_rate_attributes: [:id, :rate],
        electricity_rate_attributes: [:id, :rate],
        moto_electricity_rate_attributes: [:id, :rate]
      )
    end
end
