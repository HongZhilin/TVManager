<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>topNpie</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>
<script type="text/javascript">
    function search(){
    	 var arr1=[];
         var arr2=[];
        $.ajax({
            url: "${pageContext.request.contextPath}/business/getTopNPieData.html",
            type: 'GET',
            data:{"time":$('#time').val()},
            dataType: 'json',
            success: function (data) {
                for (var i = 0; i < 10; i++) {
                    if(data[i].time=='2015/11/01')
                    arr1.push(data[i].program);
                    arr2.push(data[i].totaltime);
                }

                var total= eval(arr2.join('+'));
                var arr3=[];
                for(var j=0;j<arr2.length;j++){
                    arr3.push((arr2[j]/total*100).toFixed(0));
                }
                var myChart1 = echarts.init(document.getElementById('pie'));
                var labelTop = {
                    normal : {
                        label : {
                            show : true,
                            position : 'center',
                            formatter : '{b}',
                            textStyle: {
                                baseline : 'bottom'
                            }
                        },
                        labelLine : {
                            show : false
                        }
                    }
                };
                var labelFromatter = {
                    normal : {
                        label : {
                            formatter : function (params){
                                return 100 - params.value + '%'
                            },
                            textStyle: {
                                baseline : 'top'
                            }
                        }
                    }
                };
                var labelBottom = {
                    normal : {
                        color: '#ccc',
                        label : {
                            show : true,
                            position : 'center'
                        },
                        labelLine : {
                            show : false
                        }
                    },
                    emphasis: {
                        color: 'rgba(0,0,0,0)'
                    }
                };
                var radius = [40, 55];
                option1 = {
                    legend: {
                        x : 'center',
                        y : 'center',
                        data:arr1
                    },
                    title : {
                        text: '每日节目榜单',
                        textStyle:{
                            color: '#000',
                            fontSize: 22
                        },
                        x: 'center'
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel'],
                                option: {
                                    funnel: {
                                        width: '20%',
                                        height: '30%',
                                        itemStyle : {
                                            normal : {
                                                label : {
                                                    formatter : function (params){
                                                        return 'other\n' + params.value + '%\n'
                                                    },
                                                    textStyle: {
                                                        baseline : 'middle'
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    series : [
                        {
                            type : 'pie',
                            center : ['10%', '30%'],
                            radius : radius,
                            x: '0%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[0], itemStyle : labelBottom},
                                {name:arr1[0], value:arr3[0],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['30%', '30%'],
                            radius : radius,
                            x:'20%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[1], itemStyle : labelBottom},
                                {name:arr1[1], value:arr3[1],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['50%', '30%'],
                            radius : radius,
                            x:'40%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[2], itemStyle : labelBottom},
                                {name:arr1[2], value:arr3[2],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['70%', '30%'],
                            radius : radius,
                            x:'60%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[3], itemStyle : labelBottom},
                                {name:arr1[3], value:arr3[3],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['90%', '30%'],
                            radius : radius,
                            x:'80%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[4], itemStyle : labelBottom},
                                {name:arr1[4], value:arr3[4],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['10%', '70%'],
                            radius : radius,
                            y: '55%',   // for funnel
                            x: '0%',    // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[5], itemStyle : labelBottom},
                                {name:arr1[5], value:arr3[5],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['30%', '70%'],
                            radius : radius,
                            y: '55%',   // for funnel
                            x:'20%',    // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[6], itemStyle : labelBottom},
                                {name:arr1[6], value:arr3[6],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['50%', '70%'],
                            radius : radius,
                            y: '55%',   // for funnel
                            x:'40%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[7], itemStyle : labelBottom},
                                {name:arr1[7], value:arr3[7],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['70%', '70%'],
                            radius : radius,
                            y: '55%',   // for funnel
                            x:'60%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[8], itemStyle : labelBottom},
                                {name:arr1[8], value:arr3[8],itemStyle : labelTop}
                            ]
                        },
                        {
                            type : 'pie',
                            center : ['90%', '70%'],
                            radius : radius,
                            y: '55%',   // for funnel
                            x:'80%', // for funnel
                            itemStyle : labelFromatter,
                            data : [
                                {name:'total', value:100-arr3[9], itemStyle : labelBottom},
                                {name:arr1[9], value:arr3[9],itemStyle : labelTop}
                            ]
                        }
                    ]
                };


                // 为echarts对象加载数据
                myChart1.setOption(option1);
            }
        });
    }
</script>
<body>
    <form method="post" id="topNPieForm">
            日期：<input type="text" name="time" id="time" value="<fmt:formatDate value="${pd.time}" pattern="yyyy/MM/dd"/>" onClick="WdatePicker({startDate:'2015-11-01', dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true})"style="width:70px;"/>
        <a href="javascript:search();" class="myBtn"><em>查询</em></a>
    </form>
    <div id="pie" style="height:600px;width:1300px"></div>
</body>

</html>