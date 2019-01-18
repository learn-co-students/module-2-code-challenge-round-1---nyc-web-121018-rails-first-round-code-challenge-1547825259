class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    # @powers = @heroine.powers
  end

def show
  @heroine = Heroine.find(params[:id])
  @heroines = Heroine.all
  @powers = Powers.all
end


def new
  @heroine = Heroine.new
  @powers = Powers.all
end


def create
  @heroine = Heroine.create(heroine_params)
  if @heroine.valid?
    redirect_to heroine_path(@heroine)
  else
    flash[:errors] = @member.errors.full_messages
    redirect_to new_heroine_path

  end

end

#
private
def heroine_params
#
  params.require(:heroine).permit(:name, :super_name)
end

end
