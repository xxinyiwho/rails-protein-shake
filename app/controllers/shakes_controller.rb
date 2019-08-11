class ShakesController < ApplicationController
  def index
    @shakes = Shake.all
  end

  def show
    @shake = Shake.find(params[:id])
  end

  def new
    @shake = Shake.new
  end

  def create
    @shake = Shake.new(shake_strong_params)
    if @shake.save
      redirect_to shake_path(@shake)
    else
      reder :new
    end
  end

  def destroy
    @shake = Shake.find(params[:id])
    @shake.destroy
    redirect_to root_path
  end

  def shake_strong_params
    params.require(:shake).permit(:name, :photo)
  end
end
