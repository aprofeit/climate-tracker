class MeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
