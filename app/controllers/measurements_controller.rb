class MeasurementsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    respond_to do |f|
      f.html
      f.json do
        measurements = Measurement.order(created_at: :desc).limit(100).reverse
        render json: {
          temperatures: measurements.map { |t| { x: t.created_at.to_i, y: t.temperature } },
          humidities: measurements.map { |t| { x: t.created_at.to_i, y: t.humidity } }
        }
      end
    end
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
