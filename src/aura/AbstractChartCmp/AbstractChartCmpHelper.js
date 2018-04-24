({
    helperMethod: function() {

    },
    drawChart: function(component, event, type, params) {
        //clear content
        var elem = document.getElementById('myChart');
        elem.parentNode.removeChild(elem);
        //create c=element
        var parent=document.getElementById('container');
        var newNode=document.createElement("canvas");
        newNode.setAttribute("id", "myChart");
        newNode.setAttribute("width", 400);
        newNode.setAttribute("height", 120);
        newNode.setAttribute("responsive", true);
        parent.appendChild(newNode);
        
        
        //draw chart
        var canvas = document.getElementById("myChart");
        var ctx = canvas.getContext('2d');
        ctx.clearRect(0, 0, canvas.width + 20, canvas.height + 20);
        var myChart = new Chart(ctx, {
            type: type,
            data: {
                labels: params.labels,
                datasets: [{
                    label: '# of Votes',
                    data: params.data,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                title: {
                    display: true,
                    text: component.get('v.title'),
                    position: 'bottom'
                },
                tooltips: {
                    callbacks: {
                        labelColor: function(tooltipItem, chart) {
                            return {
                                borderColor: 'rgb(255, 0, 0)',
                                backgroundColor: 'rgb(255, 0, 0)'
                            }
                        },
                        labelTextColor: function(tooltipItem, chart) {
                            return '#543453';
                        }
                    }
                }
            }
        });
    }
})