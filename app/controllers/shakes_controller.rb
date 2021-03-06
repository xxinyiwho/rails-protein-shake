class ShakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @shakes = policy_scope(Shake)
   if params[:query].present?
      sql_query = " \
        shakes.name @@ :query \
      "
      @shakes = Shake.where(sql_query, query: "%#{params[:query]}%")
    else
      @shakes = Shake.all
      authorize @shakes
    end
  end

  def show
    @shake = Shake.find(params[:id])
    authorize @shake
  end

  def new
    @shake = Shake.new
    authorize @shake
  end

  def create
    @shake = Shake.new(shake_strong_params)
    authorize @shake
    if @shake.save
      redirect_to shake_path(@shake)
    else
      render :new
    end
  end

  def destroy
    authorize @shake
    @shake = Shake.find(params[:id])
    @shake.destroy
    redirect_to root_path
  end

  def shake_strong_params
    params.require(:shake).permit(:name, :photo)
  end
end
