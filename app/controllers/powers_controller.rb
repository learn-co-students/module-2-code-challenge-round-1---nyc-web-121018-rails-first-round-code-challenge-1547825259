class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

def show
  @power = Power.find(params[:id])
  @powers = @heroine.powers
  # @heroines = Heroine.all
end

def power_params
params.require(:power).permit(:name, :description, :heroine_id)
end

end
