class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @powers = Power.all
    if !!flash[:data]
      @heroine = Heroine.new(flash[:data])
    else
      @heroine = Heroine.new
    end
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      flash[:data] = heroine_params
      redirect_to new_heroine_path
    end
  end

  def search
    "test"
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
