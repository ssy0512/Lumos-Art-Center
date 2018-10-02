<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<!-- pie3d script -->
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<!-- bar script -->
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script type="text/javascript">
$(function() {
	var url="<%=cp%>/admin/sales/exhibit/ExhibitBar";
	$.getJSON(url, function (csv) {
		var subject=csv.subject;
		$('#barContainer').highcharts({
			chart: {
			    type: 'column'
			},
			title: {
	            text: '전시별 누적 관람객',
	        },
	        xAxis: {
				categories: subject
	        },
	        credits: {
	            enabled: false
	        },
	        series: csv.series
		});
	});
});

$(function() {
	var url="<%=cp%>/admin/sales/exhibit/Exhibit3d";
	$.getJSON(url, function (csv) {
		$('#pie3dContainer').highcharts({
			chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 40
	            }
	        },			
			title: {
	            text: '전시별 매출 비율',
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 90,
	                depth: 40
	            }
	        },
	        series: csv
		});
	});
});
</script>

<div class="body-right" style="width: 1380px; height: 800px;">
	<div style="clear: both;">
		<div id="barContainer" style="width: 500px; height: 350px; float: left; margin: 0px; border-right: 1px solid #eee;"></div>
		<div id="pie3dContainer" style="width: 400px; height: 350px; float: left; margin: 0px; border-right: 1px solid #eee;"></div>
	</div>
	
	<div style="width: 902px; height: 450px; float: left;">
		<div style="width: 902px; height: 30px; background-color: #6fa8dc; color: #ffffff; float: left;">
			<p style="font-size: 13pt; float:left; margin-left: 350px">진행중인 전시</p>
			<p style="font-size: 13pt; float: right; margin-right: 20px">더보기</p>
		</div>
		<div style="width: 902px; height:415px; background-color: #eee; float: left;">
			<p>오늘 매출액 : 2302132</p>
		</div>
	</div>
	

	<div style="width: 470px; height: 450px; float: right;">
		<div style="width: 470px; height: 30px; background-color: #6fa8dc; color: #ffffff; float: left;">
			<p style="font-size: 13pt; float:left; margin-left: 200px">지난 전시</p>
			<p style="font-size: 13pt; float: right; margin-right: 20px">더보기</p>
		</div>
		<div style="width: 470px; height:415px; border: 1px solid #eee; float: left;">
			<div style="width: 115px; height: 30px; border: 1px solid #eee; float: left;"><p>전시 제목</p></div>
			<div style="width: 115px; height: 30px; border: 1px solid #eee; float: left;"><p>기간</p></div>
			<div style="width: 115px; height: 30px; border: 1px solid #eee; float: left;"><p>누적 관람객</p></div>
			<div style="width: 115px; height: 30px; border: 1px solid #eee; float: left;"><p>누적 매출액</p></div>
		</div>
	</div>
</div>
