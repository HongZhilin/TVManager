<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>24小时收视走势</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
</head>
<body>
<div>
    <input id='input1' type="button" value="2015-11-01" onclick="plot1()"/>
    <input id="input2" type="button" value="2015-11-02" onclick="plot2()"/>
    <input id="input3" type="button" value="2015-11-03" onclick="plot3()"/>
</div>
<div id="main" style="height:500px"></div>
<script type="text/javascript">
    function plot1(){
        $.ajax({
            url: "${pageContext.request.contextPath}/show/getHoursH.html",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var time = $("#input1").val();
                var arr1=[];//x轴
                var arr2=[];//y轴
                for (var i = 0; i < data.length; i++) {
                    if(data[i].day==time){
                        arr1.push(data[i].hour);
                        arr2.push(data[i].total);
                    }
                }
                var myChart = echarts.init(document.getElementById('main'));

                option = {
                    title : {
                        x:500,
                        text: "今日24时段收视统计",
                        textStyle : {
                            fontSize : '25',
                            fontFamily : '微软雅黑',
                            fontWeight : 'bold'
                        }
                    },
                    tooltip : {
                        trigger: 'item'
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            splitLine:false,
                            data : arr1
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            //min:2000000,
                            //max:18000000,
                            //splitNumber:6,
                            axisLabel : {
                                formatter: '{value} (s)'
                            }
                        }
                    ],
                    series : [
                        {
                            name:'二十四小时收视统计',
                            type:'line',
                            symbol: 'arrow',
                            symbolSize: 6,
                            symbolRotate: -45,
                            itemStyle:{
                                normal:{
                                    color:'#FF5500',
                                    lineStyle: {
                                        width: 2.5,
                                        type: 'dashed'
                                    }
                                }
                            },
                            data:arr2,
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值',symbol: '../images/smile.jpg'},
                                    {type : 'min', name: '最小值',symbol: '../images/cry.jpg'}
                                ]
                            }
                        }

                    ]
                };

                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        })

    }
    function plot2(){
        $.ajax({
            url: "${pageContext.request.contextPath}/show/getHoursH.html",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var time = $("#input2").val();
                var arr1=[];//x轴
                var arr2=[];//y轴
                for (var i = 0; i < data.length; i++) {
                    if(data[i].day==time){
                        arr1.push(data[i].hour);
                        arr2.push(data[i].total);
                    }
                }
                var myChart = echarts.init(document.getElementById('main'));

                option = {
                    title : {
                        x:500,
                        text: '今日24时段收视统计',
                        textStyle : {
                            fontSize : '25',
                            fontFamily : '微软雅黑',
                            fontWeight : 'bold'
                        }
                    },
                    tooltip : {
                        trigger: 'item'
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            splitLine:false,
                            data : arr1
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            min:2000000,
                            max:18000000,
                            splitNumber:6,
                            axisLabel : {
                                formatter: '{value} (s)'
                            }
                        }
                    ],
                    series : [
                        {
                            name:'二十四小时收视统计',
                            type:'line',
                            symbol: 'arrow',
                            symbolSize: 6,
                            symbolRotate: -45,
                            itemStyle:{
                                normal:{
                                    color:'#3399FF',
                                    lineStyle: {
                                        width: 2.5,
                                        type: 'dashed'
                                    }
                                }
                            },
                            data:arr2,
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值',symbol: '../images/smile.jpg'},
                                    {type : 'min', name: '最小值',symbol: '../images/cry.jpg'}
                                ]
                            }
                        }

                    ]
                };

                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        })

    }
    function plot3(){
        $.ajax({
            url: "${pageContext.request.contextPath}/show/getHoursH.html",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var time = $("#input3").val();
                var arr1=[];//x轴
                var arr2=[];//y轴
                for (var i = 0; i < data.length; i++) {
                    if(data[i].day==time){
                        arr1.push(data[i].hour);
                        arr2.push(data[i].total);
                    }
                }
                var myChart = echarts.init(document.getElementById('main'));

                option = {
                    title : {
                        x:500,
                        text: '今日24时段收视统计',
                        textStyle : {
                            fontSize : '25',
                            fontFamily : '微软雅黑',
                            fontWeight : 'bold'
                        }
                    },
                    tooltip : {
                        trigger: 'item'
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            splitLine:false,
                            data : arr1
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            min:2000000,
                            max:18000000,
                            splitNumber:6,
                            axisLabel : {
                                formatter: '{value} (s)'
                            }
                        }
                    ],
                    series : [
                        {
                            name:'二十四小时收视统计',
                            type:'line',
                            symbol: 'arrow',
                            symbolSize: 6,
                            symbolRotate: -45,
                            itemStyle:{
                                normal:{
                                    color:'#009900',
                                    lineStyle: {
                                        width: 2.5,
                                        type: 'dashed'
                                    }
                                }
                            },
                            data:arr2,
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值',symbol: '../images/smile.jpg'},
                                    {type : 'min', name: '最小值',symbol: '../images/cry.jpg'}
                                ]
                            }
                        }

                    ]
                };
                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        })
    }

</script>
</body>

</html>
