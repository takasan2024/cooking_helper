class CookingsController < ApplicationController
  before_action :set_cooking, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @cookings = Cooking.all
  end

  def new
    @cooking = Cooking.new
  end

  def create
    Cooking.create(cooking_params)
    redirect_to '/'
  end

  def destroy
    cooking = Cooking.find(params[:id])
    cooking.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    cooking = Cooking.find(params[:id])
    cooking.update(cooking_params)
    redirect_to root_path
  end

  def show
  end

  private

  def cooking_params
    params.require(:cooking).permit(:name, :image, :text)
  end

  def set_cooking
    @cooking = Cooking.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
