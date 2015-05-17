class MeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: { measurements: Measurement.order(id: :desc).limit(100).reverse }
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
