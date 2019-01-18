class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
   if params[:search]
     @heroine = Heroine.search(params[:search]).order("created_at DESC")
   else
     @heroine = Heroine.all.order('created_at DESC')
   end
 end


  def show
    @heroine = Heroine.find(params[:id])
  end

  def new

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
      flash[:data] = heroine_params
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end

  end





  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
