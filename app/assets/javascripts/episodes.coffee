
$ ->
  $data = $('#episodes-data')
  if $data.length > 0
    data = JSON.parse $data.val()
    series = []
    for serie, index in data.series
      series.push
        name: "Season #{index + 1}"
        data: serie
        maxSize: 15
        minSize: 5
        dataLabels:
          useHTML: true
        tooltip:
          headerFormat: ''
          pointFormat:"""
            <div class="highcharts-tooltip__container">
              <img class="highcharts-tooltip__img" src="{point.data.poster}">
              <p>
                <span style="font-size: 16px; color: {point.series.color};">{point.series.name} Episode {point.data.episode}</span>
                <br/>
                <strong>{point.name}</strong>
                <br/>
                <strong>Date:</strong>
                {point.data.dateString}
                <br/>
                <strong>Director:</strong>
                {point.data.director}
                <br/>
                <strong>IMDB Rating:</strong>
                {point.z}
              </p>
            </div>
            """
    opts =
      title:
        text: ''
      credits:
        enabled: false
      chart:
        type: 'bubble'
        zoomType: 'xy'
        backgroundColor: '#f1f1f1'
        borderColor: '#C7C7C7'
        borderRadius: 3
        borderWidth: 1
        spacing: [20, 20, 20, 20]
      colors: seriesColors
      series: series
      xAxis:
        type: 'datetime'
        labels:
          format: '{value:%l:%M %P}'
      tooltip:
        useHTML: true
      yAxis:
        type: 'datetime'
        reversed: true
        labels:
          format: '{value:%A}'
        title:
          text: ""
      plotOptins:
        bubble:
          zMin: 9
          zMax: data.max_rating

    $('#episodes_chart').highcharts(opts)

seriesColors = [
  "#1f77b4"
  "#ff7f0e"
  "#2ca02c"
  "#d62728"
  "#9467bd"
  "#8c564b"
  "#e377c2"
  "#7f7f7f"
  "#bcbd22"
  "#17becf"
]
