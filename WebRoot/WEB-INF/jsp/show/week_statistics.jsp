<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一周收视统计</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
</head>
<body>
<div id="pie" style="height:400px;width:550px;float:left"></div>
<div id="radar" style="height:400px;width:550px;float:left"></div>
<script type="text/javascript">
    $(function () {
        var arr1=[];
        var arr2=[];
        $.ajax({
            url: "${pageContext.request.contextPath}/show/getWeekView.html",
            type: 'post',
            dataType: 'json',
            success: function (data) {
            	console.info(data);
                for (var i = 0; i < 7; i++) {
                    arr1.push(data[i].time);
                    arr2.push(data[i].total);
                }
                var myChart1 = echarts.init(document.getElementById('pie'));
                var myChart2 = echarts.init(document.getElementById('radar'));
                option1 = {
                    title : {
                        text: '一周收视统计'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient : 'vertical',
                        x : 'left',
                        y:70,
                        data:arr1
                    },
                    calculable : true,
                    series : [
                        {
                            name:'本周统计',
                            type:'pie',
                            radius : '70%',
                            center: ['50%', 225],
                            itemStyle : {
                                normal: {
                                    label: {
                                        formatter: function (params) {
                                            return (params.percent - 0).toFixed(0) + '%'
                                        }
                                    },
                                    labelLine: {
                                        show: true
                                    }
                                }
                            },
                            data:[
                                {value:arr2[0], name:arr1[0]},
                                {value:arr2[1], name:arr1[1]},
                                {value:arr2[2], name:arr1[2]},
                                {value:arr2[3], name:arr1[3]},
                                {value:arr2[4], name:arr1[4]},
                                {value:arr2[5], name:arr1[5]},
                                {value:arr2[6], name:arr1[6]}
                            ]
                        }
                    ]
                };

                option2 = {
                    title : {
                        text: '一周收视统计'
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    polar : [
                        {
                            indicator : [
                                { text: arr1[0], max: 200000000},
                                { text: arr1[1], max: 200000000},
                                { text: arr1[2], max: 200000000},
                                { text: arr1[3], max: 200000000},
                                { text: arr1[4], max: 200000000},
                                { text: arr1[5], max: 200000000},
                                { text: arr1[6], max: 200000000}
                            ],
                            center : ['50%', 235],
                            radius : '70%'
                        }
                    ],
                    calculable : true,
                    series : [
                        {
                            name: '一周收视统计',
                            type: 'radar',
                            itemStyle: {
                                normal: {
                                    areaStyle: {
                                        type: 'default'
                                    }
                                }
                            },
                            data : [
                                {
                                    value:arr2,
                                    name : '一周收视统计'
                                }
                            ]
                        }
                    ]
                };

                // 为echarts对象加载数据
                myChart1.setOption(option1);
                myChart2.setOption(option2);
            }
        });
    });

</script>
</body>

</html>
