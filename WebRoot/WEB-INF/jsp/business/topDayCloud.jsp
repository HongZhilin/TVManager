<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>topdaycloud</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
    function plot() {
        var arr1=[];//电视节目
        var arr2=[];//观看量
        var time=$('#time').val();
        $.ajax({
            url: "${pageContext.request.contextPath}/business/getTopNPieData.html",
            type: 'GET',
            data:{"time":time},
            dataType: 'json',
            success: function (data) {
                console.info($('#time').val());
                var time = $("#time").val();
                for (var i = 0; i < data.length; i++) {
                    if (data[i].time == time) {
                        arr1.push((data[i].program));
                        arr2.push(data[i].totaltime);
                    }
                }

                var myChart = echarts.init(document.getElementById('main'));

                function createRandomItemStyle() {
                    return {
                        normal: {
                            color: 'rgb(' + [
                                Math.round(Math.random() * 160),
                                Math.round(Math.random() * 160),
                                Math.round(Math.random() * 160)
                            ].join(',') + ')'
                        }
                    };
                }

                option = {
                    title: {
                        text: '每日热门节目榜单',
                        textStyle: {
                            fontSize: '30',
                            fontFamily: '微软雅黑',
                            fontWeight: 'bold'
                        }

                    },
                    tooltip: {
                        show: true
                    },
                    series: [{
                        name: 'popular program',
                        type: 'wordCloud',
                        size: ['80%', '80%'],
                        textRotation: [0, 45, 90, -45],
                        textPadding: 0,
                        autoSize: {
                            enable: true,
                            minSize: 14
                        },
                        data: [
                            {
                                name: arr1[0],
                                value: arr2[0],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[1],
                                value: arr2[1],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[2],
                                value: arr2[2],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[3],
                                value: arr2[3],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[4],
                                value: arr2[4],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[5],
                                value: arr2[5],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[6],
                                value: arr2[6],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[7],
                                value: arr2[7],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[8],
                                value: arr2[8],
                                itemStyle: createRandomItemStyle()
                            },
                            {
                                name: arr1[9],
                                value: arr2[9],
                                itemStyle: createRandomItemStyle()
                            }
                        ]
                    }]
                };

                myChart.setOption(option);
            }
        })
    }
</script>
</head>
<body>
<form method="post">
    请选择日期
    <input type="text" name="time" id="time" onClick="WdatePicker({startDate:'2015-11-01',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true})" style="width:70px;"/>
    <input type="button" value="显示热门节目" onclick="plot()"/>
    <div id="main" style="height:600px"></div>
</form>
</body>
</html>