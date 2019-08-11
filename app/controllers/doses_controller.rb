class DosesController < ApplicationController
  def new
    @shake = Shake.find(params[:shake_id])
    @dose = Dose.new
  end

  def create
    @shake = Shake.find(params[:shake_id])
    @dose = Dose.new(dose_strong_params)
    @dose.shake = @shake
    if @dose.save
      redirect_to shake_path(@shake)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to shake_path(@dose.shake)
  end

  def dose_strong_params
    params.require(:dose).permit(:quantity, :ingredient_id)
  end
end
