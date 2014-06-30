class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def car_params
    params.require(:car).permit(:color, :mileage, :manufacturer_id, :year, :description)
  end
end
