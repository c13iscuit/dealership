class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all.order(country: :desc)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      redirect_to manufacturers_path
    else
      render :new
    end
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
