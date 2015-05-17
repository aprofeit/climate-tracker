require 'test_helper'

class MeasurementsControllerTest < ActionController::TestCase
  test 'get index' do
    get :index

    assert_equal Measurement.count, parsed_response['measurements'].size

    assert_response :ok
  end

  test 'creating a measurement' do
    assert_difference 'Measurement.count' do
      post :create, measurement: { temperature: 25.1, humidity: 30.1 }, format: :json
    end
  end

  private

  def parsed_response
    JSON.parse(@response.body)
  end
end
