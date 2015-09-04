# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

seriesColors = [
  "#1f77b4"
  "#aec7e8"
  "#ff7f0e"
  "#ffbb78"
  "#2ca02c"
  "#98df8a"
  "#d62728"
  "#ff9896"
  "#9467bd"
  "#c5b0d5"
  "#8c564b"
  "#c49c94"
  "#e377c2"
  "#f7b6d2"
  "#7f7f7f"
  "#c7c7c7"
  "#bcbd22"
  "#dbdb8d"
  "#17becf"
  "#9edae5"
]
$ ->
  $data = $('#episodes-data')
  if $data.length > 0
    data = JSON.parse $data.val()
    console.log data
    series = []
    for serie, index in data
      series.push
        name: "Season #{index + 1}"
        data: serie
        color: seriesColors[index]
        maxSize: 25
        minSize: 5
        dataLabels:
          useHTML: true
        tooltip:
          headerFormat: ''
          pointFormat:"""
            <p>
              <span style="font-size: 10px; color: {point.series.color};">{point.series.name} Episode {point.data.episode}</span>
              <br/>
              <strong>{point.name}</strong>
              <br/>
              <strong>Director:</strong>
              {point.data.director}
              <br/>
              <strong>Date:</strong>
              {point.data.dateString}
              <br/>
              <strong>IMDB Rating:</strong>
              {point.z}
            </p>
            """
    opts =
      title:
        text: ''
      credits:
        enabled: false
      chart:
        type: 'bubble'
        zoomType: 'xy'
      series: series
      xAxis:
        type: 'datetime'
        labels:
          format: '{value:%l:%M %P}'
      tooltip:
        useHTML: true
      yAxis:
        type: 'datetime'
        labels:
          format: '{value:%A}'
        title:
          text: ""

    $('#episodes_chart').highcharts(opts)
