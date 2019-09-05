class DosesController < ApplicationController
  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       shakes.name @@ :query \
  #       OR ingredients.name @@ :query \
  #     "
  #     @doses = Dose.joins(:shake).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @doses = Dose.all
  #   end
  # end

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
