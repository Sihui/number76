class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new
    @tenant = Tenant.new
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      update_room
      redirect_to @tenant
    else
      render 'new'
    end
  end

  def update
    @tenant = Tenant.find(params[:id])
    update_room
    if @tenant.update_attributes(tenant_params)
      redirect_to @tenant
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    @tenant.destroy

    redirect_to tenants_path
  end

  private
    def tenant_params
      params.require(:tenant).permit(:name, :phone)
    end

    def update_room
      number = params[:tenant][:curr_room_number]
      if number
        @tenant.curr_connection.update(active: false, is_admin: false) unless !@tenant.curr_connection
        @tenant.room_tenant_connections.create!(room_id: Room.find_by(number: number).id, active: true, is_admin: true)
      end
      rent = params[:tenant][:rooms][:rent]
      if rent && rent != @tenant.curr_room.rent
        @tenant.curr_room.update_attributes(rent: rent)
      end
    end
end
