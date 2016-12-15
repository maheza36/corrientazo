class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    find_restaurant
    if @restaurant.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_client.id
    if @restaurant.save
      redirect_to restaurants_path
    else
      flash[:success] = "Restaurant created. Ok"
      render 'new'
    end
  end

  def destroy
    find_restaurant
    if @restaurant.destroy
      flash[:success] = "Restaurant Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to restaurants_path
  end

  def update
    find_restaurant
    if @restaurant.update(restaurant_params)
      flash[:success] = "Restaurant updated. Ok"
      redirect_to restaurants_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'edit'
    end
  end


  def show
    find_restaurant
    if @restaurant.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  #strong parameters
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :gps, :image)
  end
end
