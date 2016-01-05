<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>provincefavourite</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
</head>
<body>
<div id="main" style="height:600px"></div>
<script type="text/javascript">
    $(function () {
        var arr1=[];
        var arr2=[];
        $.ajax({
            url: "${pageContext.request.contextPath}/show/getProvinceH.html",
            type: 'post',
            dataType: 'json',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                }
                var myChart = echarts.init(document.getElementById('main'));
                option = {
                    title : {
                        'text':'全国省份最受喜爱节目分布',
                        x:'center',
                        y:90,
                        textStyle:{
                            color: '#000',
                            fontSize: 22
                        }
                    },
                    series : [
                        {
                            name: 'Map',
                            type: 'map',
                            mapLocation: {
                                x : 'center',
                                y : 'top',
                                height : 500
                            },
                            selectedMode: 'multiple',
                            itemStyle: {
                                normal: {
                                    borderWidth:2,
                                    borderColor:'lightgreen',
                                    color: 'orange',
                                    label: {
                                        show: true
                                    }
                                },
                                emphasis: {                 // 也是选中样式
                                    borderWidth:2,
                                    borderColor:'#fff',
                                    color: '#32cd32',
                                    label: {
                                        show: true,
                                        textStyle: {
                                            color: '#fff'
                                        }
                                    }
                                }
                            },
                            data:[
                                {
                                    name: '广东',
                                    value: Math.round(Math.random()*1000),
                                    itemStyle: {
                                        emphasis: {                 // 也是选中样式
                                            borderWidth:5,
                                            borderColor:'yellow',
                                            color: '#cd5c5c',
                                            label: {
                                                show: false,
                                                textStyle: {
                                                    color: 'blue'
                                                }
                                            }
                                        }
                                    }
                                }
                            ],
                            markPoint : {
                                itemStyle : {
                                    normal:{
                                        color:'skyblue'
                                    }
                                },
                                data: [
                                    {name:'北京', symbolSize:20, symbol: '../images/中国故事.png'},
                                    {name:'江苏', symbolSize:22, symbol: '../images/非诚勿扰.png'},
                                    {name:'浙江', symbolSize:22, symbol: '../images/奔跑吧兄弟.png'},
                                    {name:'湖南', symbolSize:22, symbol: '../images/一年级.png'},
                                    {name:'广东', symbolSize:22, symbol: '../images/亚冠决赛.png'},
                                    {name:'江苏', symbolSize:22, symbol: '../images/非诚勿扰.png'}
                                ]
                            },
                            geoCoord: {
                                "北京":[116.46,39.92],
                                '江苏': [120.46,33.03],
                                '浙江': [120.2,29.03],
                                '湖南': [112.46,27.53],
                                '广东': [113.46,23.03],
                                '江苏': [120.46,33.03],
                            }
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart.setOption(option);
            }
        });
    });

</script>
</body>

</html>
