<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script src="https://code.highcharts.com/highcharts.js"></script>

<!-- bar script -->
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<!-- 3d pie script -->
<!-- <script src="https://code.highcharts.com/highcharts-3d.js"></script>
 -->
<script type="text/javascript">
$(function() {
	var url="<%=cp%>/admin/sales/salesSub/bar";
	$.getJSON(url, function (csv) {
		var year=csv.year;
		$('#barContainer').highcharts({
			chart: {
				type: 'column'
			},
			title: {
	            text: year+'년 공연·전시별 매출',
	        },
	        xAxis: {
	        	categories: ['1월', '2월', '3월', '4월', '5월', '6월',
	                '7월', '8월', '9월', '10월', '11월', '12월']
	        },
	        yAxis: {
	        	allowDecimals: false,
	        	min: 0,
	            title: {
	                text: '단위 : 억원(￦)'
	            },
	        },
	        tooltip: {
	            formatter: function () {
	              return '<b>' + this.x + '</b><br/>' +
	                this.series.name + ': ' + this.y + '<br/>' +
	                'Total: ' + this.point.stackTotal;
	          	}
	        },
	        plotOptions: {
	            column: {
	              stacking: 'normal'
	            }
	        },
	        series: csv.series  
		});
	});
});

$(function() {
	var url="<%=cp%>/admin/sales/salesSub/concertPie";
	$.getJSON(url, function (csv) {
		$('#concertPieContainer').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
	            type: 'pie',
	        },			
	        title: {
	            text: '진행중인 공연별 매출',
	        },
	        plotOptions: {
	            pie: {
	            	allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                	enabled: true,
	                	format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                	style: {
	                		color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                	}
	                }
	            }
	        },
	        series:csv
		});		
		console.log(csv);
	});	
});

$(function() {
	var url="<%=cp%>/admin/sales/salesSub/exhibitPie";
	$.getJSON(url, function (csv) {
		$('#exhibitPieContainer').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false,
	            type: 'pie',
	        },			
	        title: {
	            text: '진행중인 전시별 매출',
	        },
	        plotOptions: {
	            pie: {
	            	allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                	enabled: true,
	                	format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                	style: {
	                		color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                	}
	                }
	            }
	        },
	        series:csv
		});		
		console.log(csv);
	});	
});

$(function(){
	var url="<%=cp%>/admin/sales/salesSub/daySalesLine";
	$.getJSON(url, function (csv) {
		$('#daySalesLineContainer').highcharts({
	        title: {
	            text: '시간당 매출액(당일 기준)',
	        },
	        xAxis: {
	            categories: [
	            	'0시', '1시', '2시', '3시', '4시', '5시', '6시', '7시', '8시', '9시', '10시', '11시', '12시', '13시', 
	                '14시', '15시', '16시', '17시', '18시', '19시', '20시', '21시', '22시', '23시', '24시']
	        },
	        yAxis: {
	            title: {
	                text: '단위 : 만원(￦)'
	            },
	        },
	        series:csv
		});
	});
});

</script>

<div>    
	<div class="body-right" style="width: 1380px; height: 800px;">
		<div style="clear: both;">
			<div id="barContainer" 
			style="width: 445px; height: 350px; margin: 0; float: left; border-right: 1px solid #eee;"></div>
			
			<div id="concertPieContainer"
			style="width: 445px; height: 350px; margin: 0; float: left; border-right: 1px solid #eee;"></div>
			
			<div id="exhibitPieContainer"
			style="width: 445px; height: 350px; margin: 0; float: left; border-right: 1px solid #eee;"></div>
		</div>
		<div style="clear: both;">
			<div id="daySalesLineContainer"
			style="width: 1345px; height: 400px; margin: 0 float: left; border-top: 1px solid #eee;"></div>
		</div>
	</div>
</div>
