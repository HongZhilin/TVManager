<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>topNchannel</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
</head>
<body>
<div id="main" style="height:600px"></div>
<script type="text/javascript">
    var arr1=[];//电视台
    var arr2=[];//收视率
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/origin/getTopN.html",
            type:'GET',
            dataType: 'json',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    arr1.push((data[i].CHANNEL_NAME));
                }
                for (var j = 0; j < data.length; j++) {
                    arr2.push(data[j].RATING);
                }
                var myChart = echarts.init(document.getElementById('main'));

                option = {
                    title: {
                        text: '电视台收视率TOP10',
                        textStyle : {
                            fontSize : '30',
                            fontFamily : '微软雅黑',
                            fontWeight : 'bold'
                        }
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    grid: {
                        borderWidth: 0,
                        y: 80,
                        y2: 60
                    },
                    xAxis: [
                        {
                            type: 'category',
                            show: false,
                            data: arr1
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            show: false
                        }
                    ],
                    series: [
                        {
                            name: '电视台收视率TOP10',
                            type: 'bar',
                            barWidth:58,
                            itemStyle: {
                                normal: {
                                    barBorderRadius: 10,
                                    color: function(params){
                                        var colorList = [
                                            '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                            '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                            '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                        ];
                                        return colorList[params.dataIndex]
                                    },
                                    label: {
                                        show: true,
                                        position: 'top',
                                        formatter: '{b}\n{c}',
                                        textStyle : {
                                            fontSize : '15',
                                            fontFamily : '微软雅黑',
                                            fontWeight : 'bold'
                                        }
                                    }
                                }
                            },
                            data: arr2,
                            markPoint: {
                                tooltip: {
                                    trigger: 'item',
                                    backgroundColor: 'rgba(0,0,0,0)',
                                    formatter: function(params){
                                        return '<img src="'
                                                + params.data.symbol.replace('image://', '')
                                                + '"/>';
                                    }
                                },
                                data: [
                                    {xAxis:0, y: 570, name:'Line', symbolSize:20, symbol: 'image://'+arr1[0] +'.png'},
                                    {xAxis:1, y: 570, name:'Bar', symbolSize:20, symbol: 'image://'+arr1[1] +'.png'},
                                    {xAxis:2, y: 570, name:'Scatter', symbolSize:20, symbol: 'image://'+arr1[2] +'.png'},
                                    {xAxis:3, y: 570, name:'K', symbolSize:20, symbol: 'image://'+arr1[3] +'.png'},
                                    {xAxis:4, y: 570, name:'Pie', symbolSize:20, symbol: 'image://'+arr1[4] +'.png'},
                                    {xAxis:5, y: 570, name:'Radar', symbolSize:20, symbol: 'image://'+arr1[5] +'.png'},
                                    {xAxis:6, y: 570, name:'Chord', symbolSize:20, symbol: 'image://'+arr1[6] +'.png'},
                                    {xAxis:7, y: 570, name:'Force', symbolSize:20, symbol: 'image://'+arr1[7] +'.png'},
                                    {xAxis:8, y: 570, name:'Map', symbolSize:20, symbol: 'image://'+arr1[8] +'.png'},
                                    {xAxis:9, y: 570, name:'Gauge', symbolSize:20, symbol: 'image://'+arr1[9] +'.png'}
                                ]
                            }
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        })
    });
</script>
</body>
</html>