class MeasurementsController < ApplicationController
  def index
    render json: { measurements: Measurement.all }
  end

  def create
    Measurement.create!(measurement_params)

    render json: { status: 'created' }, status: :created
  end

  private

  def measurement_params
    params.require(:measurement).permit(:temperature, :humidity)
  end
end
