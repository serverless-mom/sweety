class ReadingsController < ApplicationController
  
  def new
    @reading = Reading.new
  end
  
  def show
    @reading = Reading.find(params[:id])
  end
  
  def create
    @reading = current_user.readings.build(reading_params)
    if @reading.save
      flash[:success] = "reading saved, thank you!"
      redirect_to @reading
    else
      flash[:error] = "This reading could not be recorded! #{@reading.errors.messages}"
      render 'new'
    end
  end
  
  private
  
  def reading_params
    params.require(:reading).permit(:glucose_level, :date_measured)
  end
end
