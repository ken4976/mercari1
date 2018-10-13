class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]
  
  def new
    # @user = current_user
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    if address.save
      redirect_to mains_top_path
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to mains_top_path
    else
      render :new
    end
  end


private
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:area, :city, :postal_code, :address1, :address2).merge(user_id: current_user.id)
  end
end
