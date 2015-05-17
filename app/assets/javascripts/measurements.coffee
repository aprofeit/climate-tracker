$ ->
  $chart = $('.measurements_chart')
  ctx = $chart.get(0).getContext('2d')

  $.get '/measurements.json', (response) ->
    data = {
      labels: response.labels,
      datasets: [
        {
          label: 'Humidity',
          fillColor: 'rgba(220,220,220,0.2)',
          strokeColor: 'rgba(220,220,220,1)',
          pointColor: 'rgba(220,220,220,1)',
          pointStrokeColor: '#fff',
          pointHighlightFill: '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data: response.humidities
        },
        {
          label: 'Temperature',
          fillColor: 'rgba(151,187,205,0.2)',
          strokeColor: 'rgba(151,187,205,1)',
          pointColor: 'rgba(151,187,205,1)',
          pointStrokeColor: '#fff',
          pointHighlightFill: '#fff',
          pointHighlightStroke: 'rgba(151,187,205,1)',
          data: response.temperatures
        }
      ]
    }

    chart = new Chart(ctx).Line(data, responsive: true)
