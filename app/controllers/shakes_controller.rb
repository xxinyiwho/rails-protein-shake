class ShakesController < ApplicationController
  def index
    @shakes = Shake.all
  end

  def show
    @shake = Shake.find(params[:id])
  end

  def new
    @shake = Shake.new(shake_strong_params)
  end

  def create
    @shake = Shake.new(shake_strong_params)
    if @shake.save
      redirect_to shakes.path
    else
      reder :new
    end
  end

  def shake_strong_params
    params.require(:shake).permit(:name)
  end
end
