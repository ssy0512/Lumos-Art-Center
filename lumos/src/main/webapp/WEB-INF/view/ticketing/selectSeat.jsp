<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<style type="text/css">
/* 체크박스 */
input[type="checkbox"] {
	display: none;
}

input[name="R"] + label {
	display: inline-block; 
	width:18px; 
	height: 18px; 
	background: #592ae8;
	cursor: pointer; 
	border-radius: 3px;
	margin-bottom:5px; 
}

input[type="checkbox"]:checked + label {
	background:#434343; 
}

input[name="S"] + label {
	display: inline-block; 
	width:18px; 
	height: 18px; 
	background: #0da746;
	cursor: pointer; 
	border-radius: 3px;
	margin-bottom:5px; 
}

input[name="A"] + label {
	display: inline-block; 
	width:18px; 
	height: 18px; 
	background: #f9fc8d;
	cursor: pointer; 
	border-radius: 3px;
	margin-bottom:5px; 
}
 
input[name="dis"] + label {
	display: inline-block; 
	width:44px;  
	height: 18px; 
	background: #592ae8;
	cursor: pointer; 
	border-radius: 3px;
}
input[name="dis"]:checked + label {
	background:#434343; 
}
</style>

<script type="text/javascript">
function goTicketing(){
	var count = 0;
	var array=new Array();
	$("input[type=checkbox]:checked").each(function() {
		  var test = $(this).val();
		  array.push(test);
 		  count++;
	});
	
	if(count>5){
		alert('좌석은 최대 5개까지만 선택하실 수 있습니다.');
		return;
	}else if(count=0){
		alert('좌석을 선택해 주세요.');
		return;
	}
	var url="<%=cp%>/ticketing/book";
	var query=$('form[name=seatForm]').serialize();
	
	location.href=url+"?"+query;
}

</script>

<div class="body-container" style="margin-top:15px;"> 
<form name="seatForm" action="" method="post">
	<div style="font-size:20pt;background-color:#cccccc;border-radius: 4px;height:115px;text-align:center;line-height:105px;margin-bottom:15px;">stage</div>
	<div class="eventHall-56" style="text-align:center;">
		
		<p style="padding:20px 0px; text-align:left;">
			<span style="font-weight:bold;margin:40px;">3F</span>  
			<span style="font-weight:bold;margin:40px;">2F</span>
			<span style="font-weight:bold;margin:290px;">1F</span><br>
		</p>
		<div class="third" style="border:1px solid #d3d3d3; border-top:none;width:1020px;margin-bottom:15px;">
			<div class="second" style="border:1px solid #d3d3d3; border-top:none; width:800px;margin:0px 100px 0px 100px;">
				<div class="first" style="border:1px solid #d3d3d3; border-top:none; width:600px;margin:0px 100px 0px 100px;padding-bottom:30px;">
					<input type="checkbox" id="dis1" name="dis" value="dis1"/><label for="dis1">장</label>&nbsp;&nbsp;
					<input type="checkbox" id="dis2" name="dis" value="dis2"/><label for="dis2">장</label>&nbsp;
					<c:forEach var="i" begin="6" end="10" step="1">
						<input type="checkbox" id="1check${i}" value="1check-${i}" name="R"/>
						<label for="1check${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="5" step="1">
						<input type="checkbox" id="1check${i}" value="1check-${i}" name="R"/>
						<label for="1check${i}">${i}</label>
					</c:forEach>
					<input type="checkbox" id="dis3" name="dis" value="dis3"/><label for="dis3">장</label>
					<input type="checkbox" id="dis4" name="dis" value="dis4"/><label for="dis4">장</label><br>
					<c:forEach var="j" begin="2" end="5" step="1">
						<c:forEach var="i" begin="1" end="10" step="1">
							<input type="checkbox" id="acheck${j}${i}" value="acheck-${j}-${i}" name="R"/>
							<label for="acheck${j}${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="9" step="1">
							<input type="checkbox" id="bcheck${j}${i}" value="bcheck-${j}-${i}" name="R"/>
							<label for="bcheck${j}${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
					<c:forEach var="j" begin="6" end="9" step="1">
						<c:forEach var="i" begin="1" end="10" step="1">
							<input type="checkbox" id="acheck${j}${i}" value="acheck-${j}-${i}" name="S"/>
							<label for="acheck${j}${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="9" step="1">
							<input type="checkbox" id="bcheck${j}${i}" value="bcheck-${j}-${i}" name="S"/>
							<label for="bcheck${j}${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
				</div>
				<div style="margin-top:10px;padding-left:10px;">
					<c:forEach var="i" begin="1" end="10" step="1">
						<input type="checkbox" id="2check${i}" value="2check-${i}" name="S"/>
						<label for="2check${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="28" end="37" step="1">
						<input type="checkbox" id="2check${i}" value="2check-${i}" name="S"/>
						<label for="2check${i}">${i}</label>
					</c:forEach>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="11" end="19" step="1">
						<input type="checkbox" id="2check${i}" value="2check-${i}" name="S"/>
						<label for="2check${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="20" end="27" step="1">
						<input type="checkbox" id="2check${i}" value="2check-${i}" name="S"/>
						<label for="2check${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<div style="margin-top:10px;">
				<c:forEach var="i" begin="1" end="9" step="1">
					<input type="checkbox" id="3check${i}" value="3check-${i}" name="A"/>
					<label for="3check${i}">${i}</label>
				</c:forEach>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:forEach var="i" begin="10" end="18" step="1">
					<input type="checkbox" id="3check${i}" value="3check-${i}" name="A"/>
					<label for="3check${i}">${i}</label>
				</c:forEach>
			</div>
		</div>
		
		<div style="text-align:center;">
			<button type="button" class="adBtn" onclick="history.back();">
				이전단계
			</button>
			<button type="button" class="adBtn" onclick="goTicketing();">
				다음단계
			</button>
		</div>
	</div>
	<input type="hidden" name="sessionNum" value="${sessionNum }">
	<input type="hidden" name="hallNum" value="${hallNum }">
	</form>
</div>
