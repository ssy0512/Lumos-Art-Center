<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<!-- pie3d script -->
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<!-- bar script -->
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script type="text/javascript">
$(function() {
	var url="<%=cp%>/admin/sales/academy/AcademyBar";
	$.getJSON(url, function (csv) {
		var subject=csv.subject;
		$('#barContainer').highcharts({
			chart: {
			    type: 'column'
			},
			title: {
	            text: '강좌별 매출',
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
	var url="<%=cp%>/admin/sales/academy/AcademyPie3d";
		$.getJSON(url, function(csv) {
			var chart = $('#pie3dContainer').highcharts({
				chart : {
					type : 'pie',
					options3d : {
						enabled : true,
						alpha : 40
					}
				},
				title : {
					text : '신청 마감률',
				},
				plotOptions : {
					pie : {
						innerSize : 90,
						depth : 40
					}
				},
				series : csv
			});
		});
	});
</script>
<div class="body-right" style="width: 1380px; height: 800px;">
	<div style="clear: both;">
		<div id="barContainer" style="width: 800px; height: 350px; float: left; margin: 0px; border-right: 1px solid #eee;"></div>
		<div id="pie3dContainer" style="width: 400px; height: 350px; float: left; margin: 0px; border-right: 1px solid #eee;"></div>
	</div>
	
	<div style="width: 852px; height: 450px; float: left;">
		<div style="width: 852px; height: 30px; background-color: #6fa8dc; color: #ffffff; float: left;">
			<p style="font-size: 13pt; float:left; margin-left: 350px">접수마감 강좌</p>
			<p style="font-size: 13pt; float: right; margin-right: 20px">더보기</p>
		</div>
		<div style="width: 852px; height:415px; margin-top: 5px; background-color: #green; float: left; text-align: center">
			<div style="width: 150px; height: 25px; border: 1px solid #eee; float: left;"><p>분류</p></div>
			<div style="width: 240px; height: 25px; border: 1px solid #eee; float: left;"><p>강좌명</p></div>
			<div style="width: 100px; height: 25px; border: 1px solid #eee; float: left;"><p>강사</p></div>
			<div style="width: 100px; height: 25px; border: 1px solid #eee; float: left;"><p>수강인원</p></div>
			<div style="width: 150px; height: 25px; border: 1px solid #eee; float: left;"><p>금액</p></div>
			<div style="width: 100px; height: 25px; border: 1px solid #eee; float: left;"><p>상태</p></div>
		</div>
	</div>
	

	<div style="width: 520px; height: 450px; float: right;">
		<div style="width: 520px; height: 30px; background-color: #6fa8dc; color: #ffffff; float: left;">
			<p style="font-size: 13pt; float:left; margin-left: 200px">접수중 강좌</p>
			<p style="font-size: 13pt; float: right; margin-right: 20px">더보기</p>
		</div>
		<div style="width: 520px; height:415px; margin-top: 5px; border: 1px solid #eee; float: left; text-align: center">
			<div style="width: 120px; height: 25px; border: 1px solid #eee; float: left;"><p>분류</p></div>
			<div style="width: 180px; height: 25px; border: 1px solid #eee; float: left;"><p>강좌명</p></div>
			<div style="width: 60px; height: 25px; border: 1px solid #eee; float: left;"><p>수강인원</p></div>
			<div style="width: 80px; height: 25px; border: 1px solid #eee; float: left;"><p>총액</p></div>
			<div style="width: 70px; height: 25px; border: 1px solid #eee; float: left;"><p>상태</p></div>
		</div>
	</div>
</div>