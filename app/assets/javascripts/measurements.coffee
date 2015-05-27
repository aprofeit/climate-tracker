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

    hover = new Rickshaw.Graph.HoverDetail
      graph: graph
      xFormatter: (x) ->
        new Date(x * 1000).toString()

    unit_formatter = name: '1 hour', seconds: 3600, formatter: (d) -> moment(d).format('H:mm')
    axes = new Rickshaw.Graph.Axis.Time(graph: graph, timeUnit: unit_formatter)

    y_axis = new Rickshaw.Graph.Axis.Y(graph: graph, element: $('.y-axis')[0], orientation: 'left', tickFormat: Rickshaw.Fixtures.Number.formatKMBT)

    graph.render()

