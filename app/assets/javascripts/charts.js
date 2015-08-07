$(function () {
    $('#rating_chart').highcharts({
        title: {
            text: 'Изменение рейтинга по игровым дням',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            title: {
                text: 'Игровой день'
            },
            categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
        },
        yAxis: {
            title: {
                text: 'Рейтинг'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Спаич',
            data: [50, 60, 80, 75, 65, 85, 100, 90, 75, 80, 82, 100]
        }, {
            name: 'Амбал',
            data: [40, 50, 90, 85, 65, 55, 95, 92, 70, 50, 62, 85]
        }]
    });
});
