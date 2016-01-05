<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>provinceheat</title>
    <script type="text/javascript" src="../js/echarts-all.js"></script>
    <script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
</head>
<body>
<div id="main" style="height:600px"></div>
<script type="text/javascript">
    $(function () {
        var arr1=[];
        var arr2=[];
        var arr3=[];
        var arr4=[];
        var arr5=[];
        var arr6=[];
        var arr7=[];
        var arr8=[];
        var arr9=[];
        var arr10=[];
        var arr11=[];
        var arr12=[];
        var arr13=[];
        var arr14=[];
        var arr15=[];
        $.ajax({
            url: "${pageContext.request.contextPath}/show/getProvinceH.html",
            type: 'post',
            dataType: 'json',
            success: function (data) {
            	console.info(data);
                for (var i = 0; i < data.length; i++) {
                    if(data[i].time=="2015-11-1"){
                        arr1.push(data[i]);
                    }
                    if(data[i].time=="2015-11-2"){
                        arr2.push(data[i]);
                    }
                    if(data[i].time=="2015-11-3"){
                        arr3.push(data[i]);
                    }
                    if(data[i].time=="2015-11-4"){
                        arr4.push(data[i]);
                    }
                    if(data[i].time=="2015-11-5"){
                        arr5.push(data[i]);
                    }
                    if(data[i].time=="2015-11-6"){
                        arr6.push(data[i]);
                    }
                    if(data[i].time=="2015-11-7"){
                        arr7.push(data[i]);
                    }
                    if(data[i].time=="2015-11-8"){
                        arr8.push(data[i]);
                    }
                    if(data[i].time=="2015-11-9"){
                        arr9.push(data[i]);
                    }
                    if(data[i].time=="2015-11-10"){
                        arr10.push(data[i]);
                    }
                    if(data[i].time=="2015-11-11"){
                        arr11.push(data[i]);
                    }
                    if(data[i].time=="2015-11-12"){
                        arr12.push(data[i]);
                    }
                    if(data[i].time=="2015-11-13"){
                        arr13.push(data[i]);
                    }
                    if(data[i].time=="2015-11-14"){
                        arr14.push(data[i]);
                    }
                    if(data[i].time=="2015-11-15"){
                        arr15.push(data[i]);
                    }
                }

                var myChart = echarts.init(document.getElementById('main'));

                option = {
                    timeline:{
                        data:[
                            '11-01','11-02','11-03','11-04','11-05','11-06',
                            '11-07','11-08','11-09','11-10','11-11', '11-12',
                            '11-13','11-14','11-15'
                        ],
                        label : {
                            formatter : function(s) {
                                return s.slice(0, 6);
                            }
                        },
                        autoPlay : true,
                        playInterval : 1000
                    },
                    options:[
                             {
                                 title : {
                                     'text':'11-01号全国收视率分布',
                                     x:'center',
                                     y:110,
                                     textStyle:{
                                         color: '#000',
                                         fontSize: 22
                                     }
                                 },
                                 tooltip : {'trigger':'item'},
                                 toolbox : {
                                     'show':true,
                                     'feature':{
                                         'mark':{'show':true},
                                         'dataView':{'show':true,'readOnly':false},
                                         'restore':{'show':true},
                                         'saveAsImage':{'show':true}
                                     }
                                 },
                                 dataRange: {
                                     min: 1000000,
                                     max : 5000000,
                                     text:['高','低'],
                                     calculable : true,
                                     x: 'left',
                                     color: ['orangered','yellow','lightskyblue']
                                 },
                                 series : [
                                     {
                                         'name':'观看时长(s)',
                                         'type':'map',
                                          itemStyle:{
                                             normal:{
                                                 label:{show:true},
                                                 borderColor:'#ef6',
                                                 borderWidth:0.5
                                             }
                                          },
                                          data: arr1
                                     }
                                 ]
                             },
                             {
                                 title : {'text':'11-02号全国收视率分布'},
                                 series : [
                                     {'data': arr2}
                                 ]
                             },
                             {
                                 title : {'text':'11-03号全国收视率分布'},
                                 series : [
                                     {'data': arr3}
                                 ]
                             },
                             {
                                 title : {'text':'11-04号全国收视率分布'},
                                 series : [
                                     {'data': arr4}
                                 ]
                             },
                             {
                                 title : {'text':'11-05号全国收视率分布'},
                                 series : [
                                     {'data': arr5}
                                 ]
                             },
                             {
                                 title : {'text':'11-06号全国收视率分布'},
                                 series : [
                                     {'data': arr6}
                                 ]
                             },
                             {
                                 title : {'text':'11-07号全国收视率分布'},
                                 series : [
                                     {'data': arr7}
                                 ]
                             },
                             {
                                 title : {'text':'11-08号全国收视率分布'},
                                 series : [
                                     {'data': arr8}
                                 ]
                             },
                             {
                                 title : {'text':'11-09号全国收视率分布'},
                                 series : [
                                     {'data': arr9}
                                 ]
                             },
                             {
                                 title : {'text':'11-10号全国收视率分布'},
                                 series : [
                                     {'data': arr10}
                                 ]
                             },
                             {
                                 title : {'text':'11-11号全国收视率分布'},
                                 series : [
                                     {'data': arr11}
                                 ]
                             },
                             {
                                 title : {'text':'11-12号全国收视率分布'},
                                 series : [
                                     {'data': arr12}
                                 ]
                             },
                             {
                                 title : {'text':'11-13号全国收视率分布'},
                                 series : [
                                     {'data': arr13}
                                 ]
                             },
                             {
                                 title : {'text':'11-14号全国收视率分布'},
                                 series : [
                                     {'data': arr14}
                                 ]
                             },
                             {
                                 title : {'text':'11-15号全国收视率分布'},
                                 series : [
                                     {'data': arr15}
                                 ]
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
