class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @powers = Power.all
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @powers = Power.all
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end

  end

  private
  def heroine_params
    params.require(:heroine).permit(:super_name, :name, :power_id)
  end


end
