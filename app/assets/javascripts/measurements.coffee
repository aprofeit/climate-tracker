palette = new Rickshaw.Color.Palette(scheme: 'colorwheel')

$ ->
  $.get '/measurements.json', (response) ->
    graph = new Rickshaw.Graph
      element: $('.measurements-graph')[0]
      series: [
        { name: 'Humidity', color: palette.color(), data: response.humidities },
        { name: 'Temperature', color: palette.color(), data: response.temperatures }
      ]
      renderer: 'line'
      height: window.innerHeight - 100
      min: 'auto'

    hover = new Rickshaw.Graph.HoverDetail(graph: graph)
    axes = new Rickshaw.Graph.Axis.Time(graph: graph)
    y_axis = new Rickshaw.Graph.Axis.Y(graph: graph, element: $('.y-axis')[0], orientation: 'left', tickFormat: Rickshaw.Fixtures.Number.formatKMBT)

    graph.render()

