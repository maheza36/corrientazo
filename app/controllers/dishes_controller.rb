class DishesController < ApplicationController

  def new
    @dish = Dish.new
  end

  def index
    @dish = Dish.all
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      flash[:success] = "created. Ok"
      redirect_to dishes_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'new'
    end
  end

  def edit
    find_dish
    if @dish.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to dishes_path
    end
  end

  def update
    find_dish
    if @dish.update(dish_params)
      flash[:success] = "updated. Ok"
      redirect_to dishes_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'edit'
    end
  end

  def destroy
    find_dish
    if @dish.destroy
      flash[:success] = "Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to dishes_path
  end

  def show
    find_dish
    if @dish.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to dishes_path
    end
  end

  private

  def find_dish
    @dish = Dish.find_by(id: params[:id])
  end

  def dish_params
    params.require(:dish).permit(:restaurant_id, :name, :avatar)
  end

end
