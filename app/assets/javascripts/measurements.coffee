$ ->
  ctx = $('.measurements_chart').get(0).getContext('2d')

  $.get '/measurements.json', (response) ->
    data = {
      labels: response.labels,
      datasets: [
        {
          label: 'Humidity',
          data: response.humidities
        },
        {
          label: 'Temperature',
          data: response.temperatures
        }
      ]
    }

    chart = new Chart(ctx).Line(data)
