<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.exhibit-main-list {
	width: 902px; height: 450px;
	float: left;
}
.exhibit-main-list-top{
	height: 35px;
	line-height: 35px;
	background-color: #072659;
	color: #ffffff;
	font-size: 13pt;
	text-align: center;
}



.basicBox {
  width: 70px;
  height: 30px;
  margin: 2px 2px;
  color: #ffffff;
  background: #072659;
  font-family: 'Open Sans', sans-serif;
  font-size: 11pt;
  line-height: 30px;
  text-transform: uppercase;
  text-align: center;
  position: relative;
  cursor: pointer;
}
/* Basic Box */
.btn svg rect {
  fill: none;
  stroke: #072659;
  stroke-width: 1;
  stroke-dasharray: 400, 0;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
.basicBox a {
	color: #ffffff;
}
.basicBox:hover svg rect {
stroke: #ffffff;
color: #ffffff;
  stroke-width: 2;
  stroke-dasharray: 20, 200;
  stroke-dashoffset: 100;
  -webkit-transition: all 0.8s ease-in-out;
  -moz-transition: all 0.8s ease-in-out;
  -ms-transition: all 0.8s ease-in-out;
  -o-transition: all 0.8s ease-in-out;
}
svg {
  position: absolute;
  top: 1;
  left: 0;
}

</style>

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
	
	<div class="exhibit-main-list">
		<div class="exhibit-main-list-top">
			<span>진행중인 전시</span>
					
			<div class="basicBox" style=" float: right;"
				onclick="javascript:location.href='<%=cp%>/admin/sales/exhibit/salesList';">더보기
				<svg width="70" height="30" viewBox="0 0 70 35" xmlns="http://www.w3.org/2000/svg">
			    	<rect x='0' y='0' fill='none' width='70' height='50'/>
			  	</svg>
			</div>
		</div>
		<div style="width: 902px; height:415px; float: left;">
			<c:if test="${dataCount!=0}">
				<c:forEach var="dto" items="${list}">
					<table>
						<tr>
							<td>전시번호</td>
							<td>전시명</td>
							<td>주최</td>
							<td>주관</td>
							<td>전시장</td>
						</tr>
						<tr>
							<td>${dto.exhibitNum}</td>
							<td>${dto.exhibitName}</td>
							<td>${dto.host}</td>
							<td>${dto.supervise}</td>
							<td>${dto.hallName}</td>
						</tr>
					</table>
				</c:forEach>
			</c:if>
			<c:if test="${dataCount==0}">진행중인 공연이 없습니다.</c:if>
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
