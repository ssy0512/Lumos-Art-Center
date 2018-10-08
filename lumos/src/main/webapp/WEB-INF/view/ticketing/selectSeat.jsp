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
 
</style>

<script type="text/javascript">
function goTicketing(){
	var f = document.seatForm;
	var count = 0;
	$("input[type=checkbox]:checked").each(function() {
 		  count++;
	});
	
	if(count>5){
		alert('좌석은 최대 5개까지만 선택하실 수 있습니다.');
		return false;
	}else if(count==0){
		alert('좌석을 선택해 주세요.');
		return false;
	}
	
	var num=$("input[name=sessionNum]").val();
	var hnum=$("input[name=hallNum]").val();
	f.action="<%=cp%>/ticketing/book?sessionNum="+num+"&hallNum="+hnum;
	
	return true;
}

</script>

<div class="body-container" style="margin-top:15px;width:1400px;">  
<form name="seatForm" method="post" onsubmit="return goTicketing();">
	<c:if test="${hallNum==3 || hallNum==4 }">
	<div class="eventHall-56" style="text-align:center;width:1020px;margin: auto;">
	<div style="font-size:20pt;background-color:#cccccc;border-radius: 4px;height:115px;text-align:center;line-height:105px;margin-bottom:15px;">stage</div>
		
		<p style="padding:20px 0px; text-align:left;">
			<span style="font-weight:bold;margin:40px;">3F</span>  
			<span style="font-weight:bold;margin:40px;">2F</span>
			<span style="font-weight:bold;margin:290px;">1F</span><br>
		</p>
		<div class="third" style="border:1px solid #d3d3d3; border-top:none;width:1020px;margin-bottom:15px;">
			<div class="second" style="border:1px solid #d3d3d3; border-top:none; width:800px;margin:0px 100px 0px 100px;">
				<div class="first" style="border:1px solid #d3d3d3; border-top:none; width:600px;margin:0px 100px 0px 100px;padding-bottom:30px;">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="4" end="10" step="1">
						<input type="checkbox" id="acheck-1-${i}" value="acheck-1-${i}" name="R"/>
						<label for="acheck-1-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="7" step="1">
						<input type="checkbox" id="bcheck-1-${i}" value="bcheck-1-${i}" name="R"/>
						<label for="bcheck-1-${i}">${i}</label>
					</c:forEach>
					<br>
					<c:forEach var="j" begin="2" end="5" step="1">
						<c:forEach var="i" begin="1" end="10" step="1">
							<input type="checkbox" id="acheck-${j}-${i}" value="acheck-${j}-${i}" name="R"/>
							<label for="acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="9" step="1">
							<input type="checkbox" id="bcheck-${j}-${i}" value="bcheck-${j}-${i}" name="R"/>
							<label for="bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
					<c:forEach var="j" begin="6" end="9" step="1">
						<c:forEach var="i" begin="1" end="10" step="1">
							<input type="checkbox" id="acheck-${j}-${i}" value="acheck-${j}-${i}" name="S"/>
							<label for="acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="9" step="1">
							<input type="checkbox" id="bcheck-${j}-${i}" value="bcheck-${j}-${i}" name="S"/>
							<label for="bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
				</div>
				<div style="margin-top:10px;padding-left:10px;">
					<c:forEach var="i" begin="1" end="10" step="1">
						<input type="checkbox" id="2check-${i}" value="2check-${i}" name="S"/>
						<label for="2check-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="28" end="37" step="1">
						<input type="checkbox" id="2check-${i}" value="2check-${i}" name="S"/>
						<label for="2check-${i}">${i}</label>
					</c:forEach>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="11" end="19" step="1">
						<input type="checkbox" id="2check-${i}" value="2check-${i}" name="S"/>
						<label for="2check-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="20" end="27" step="1">
						<input type="checkbox" id="2check-${i}" value="2check-${i}" name="S"/>
						<label for="2check-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<div style="margin-top:10px;">
				<c:forEach var="i" begin="1" end="9" step="1">
					<input type="checkbox" id="3check-${i}" value="3check-${i}" name="A"/>
					<label for="3check-${i}">${i}</label>
				</c:forEach>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:forEach var="i" begin="10" end="18" step="1">
					<input type="checkbox" id="3check-${i}" value="3check-${i}" name="A"/>
					<label for="3check-${i}">${i}</label>
				</c:forEach>
			</div>
		</div>
	</div>
	</c:if>
	
	<c:if test="${hallNum==3 || hallNum==4 }">
	<div class="eventHall-34" style="text-align:center;width:1020px;margin:auto;">
	<div style="font-size:20pt;background-color:#cccccc;border-radius: 4px;height:115px;text-align:center;line-height:105px;margin-bottom:15px;">stage</div>
		
		<p style="padding:20px 0px; text-align:left;">
			<span style="font-weight:bold;margin:40px;">2F</span>
			<span style="font-weight:bold;margin:395px;">1F</span><br>
		</p>
			<div class="second" style="border:1px solid #d3d3d3; border-top:none; width:1020px;">
				<div class="first" style="border:1px solid #d3d3d3; border-top:none; width:800px;margin:0px 100px 0px 100px;padding-bottom:30px;">
					<c:forEach var="j" begin="1" end="7" step="1">
						<c:forEach var="i" begin="1" end="6" step="1">
							<input type="checkbox" id="acheck-${j}-${i}" value="acheck-${j}-${i}" name="R"/>
							<label for="acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="16" step="1">
							<input type="checkbox" id="bcheck-${j}-${i}" value="bcheck-${j}-${i}" name="R"/>
							<label for="bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="6" step="1">
							<input type="checkbox" id="ccheck-${j}-${i}" value="ccheck-${j}-${i}" name="R"/>
							<label for="ccheck-${j}-${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
					<c:forEach var="j" begin="8" end="13" step="1">
						<c:forEach var="i" begin="1" end="6" step="1">
							<input type="checkbox" id="acheck-${j}-${i}" value="acheck-${j}-${i}" name="S"/>
							<label for="acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="16" step="1">
							<input type="checkbox" id="bcheck-${j}-${i}" value="bcheck-${j}-${i}" name="S"/>
							<label for="bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="6" step="1">
							<input type="checkbox" id="ccheck-${j}-${i}" value="ccheck-${j}-${i}" name="S"/>
							<label for="ccheck-${j}-${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
					<c:forEach var="i" begin="4" end="6" step="1">
						<input type="checkbox" id="acheck-14-${i}" value="acheck-14-${i}" name="S"/>
						<label for="acheck-14-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="16" step="1">
						<input type="checkbox" id="bcheck-14-${i}" value="acheck-14-${i}" name="S"/>
						<label for="bcheck-14-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="3" step="1">
						<input type="checkbox" id="ccheck-14-${i}" value="ccheck-14-${i}" name="S"/>
						<label for="ccheck-14-${i}">${i}</label>
					</c:forEach>
				</div>
				<div style="margin-top:10px;padding-left:10px;">
					<c:forEach var="i" begin="1" end="10" step="1">
						<input type="checkbox" id="2acheck-${i}" value="2acheck-${i}" name="A"/>
						<label for="2acheck-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="10" step="1">
						<input type="checkbox" id="2bcheck-${i}" value="2bcheck-${i}" name="A"/>
						<label for="2bcheck-${i}">${i}</label>
					</c:forEach>
					<br>
					<c:forEach var="j" begin="1" end="3" step="1">
						<c:forEach var="i" begin="1" end="13" step="1">
							<input type="checkbox" id="2acheck-${j}-${i}" value="2acheck-${j}-${i}" name="A"/>
							<label for="2acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="13" step="1">
							<input type="checkbox" id="2bcheck-${j}-${i}" value="2bcheck-${j}-${i}" name="A"/>
							<label for="2bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach> 
				</div>
			</div>  
		</div>
	</c:if>
	
	<c:if test="${hallNum==1 || hallNum==2 }">
	<div class="eventHall-12" style="text-align:center; width:1400px;margin:auto;">
	<div style="font-size:20pt;background-color:#cccccc;border-radius: 4px;height:115px;text-align:center;line-height:105px;margin-bottom:15px;">stage</div>
		
		<p style="padding:20px 0px; text-align:left;">
			<span style="font-weight:bold;margin:40px;">2F</span>
			<span style="font-weight:bold;margin:600px;">1F</span><br> 
		</p>
			<div class="second" style="border:1px solid #d3d3d3; border-top:none; width:1400px;">
				<div class="first" style="border:1px solid #d3d3d3; border-top:none; width:1300px;margin:0px 50px 0px 50px;padding-bottom:30px;">
					<c:forEach var="j" begin="1" end="6" step="1">
						<c:forEach var="i" begin="1" end="18" step="1">
							<input type="checkbox" id="acheck-${j}-${i}" value="acheck-${j}-${i}" name="R"/>
							<label for="acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="18" step="1">
							<input type="checkbox" id="bcheck-${j}-${i}" value="bcheck-${j}-${i}" name="R"/>
							<label for="bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="18" step="1">
							<input type="checkbox" id="ccheck-${j}-${i}" value="ccheck-${j}-${i}" name="R"/>
							<label for="ccheck-${j}-${i}">${i}</label>
						</c:forEach>
						<br>
					</c:forEach>
					<c:forEach var="j" begin="7" end="12" step="1">
						<c:forEach var="i" begin="1" end="18" step="1">
							<input type="checkbox" id="acheck-${j}-${i}" value="acheck-${j}-${i}" name="S"/>
							<label for="acheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="18" step="1">
							<input type="checkbox" id="bcheck-${j}-${i}" value="bcheck-${j}-${i}" name="S"/>
							<label for="bcheck-${j}-${i}">${i}</label>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="i" begin="1" end="18" step="1">
							<input type="checkbox" id="ccheck-${j}-${i}" value="ccheck-${j}-${i}" name="S"/>
							<label for="ccheck-${j}-${i}">${i}</label>
						</c:forEach>
					</c:forEach>
						<br><br><br>
					<c:forEach var="i" begin="1" end="23" step="1">
						<input type="checkbox" id="acheck-13-${i}" value="acheck-13-${i}" name="S"/>
						<label for="acheck-13-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="23" step="1">
						<input type="checkbox" id="bcheck-13-${i}" value="acheck-13-${i}" name="S"/>
						<label for="bcheck-13-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div style="margin-top:10px;padding-left:10px;">
					<c:forEach var="i" begin="1" end="17" step="1">
						<input type="checkbox" id="2acheck-${i}" value="2acheck-${i}" name="A"/>
						<label for="2acheck-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="17" step="1">
						<input type="checkbox" id="2bcheck-${i}" value="2bcheck-${i}" name="A"/>
						<label for="2bcheck-${i}">${i}</label>
					</c:forEach>
					<br>
					<c:forEach var="i" begin="1" end="20" step="1">
						<input type="checkbox" id="2acheck-1-${i}" value="2acheck-1-${i}" name="A"/>
						<label for="2acheck-1-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="20" step="1">
						<input type="checkbox" id="2bcheck-1-${i}" value="2bcheck-1-${i}" name="A"/>
						<label for="2bcheck-1-${i}">${i}</label>
					</c:forEach> 
					<br>
					<c:forEach var="i" begin="1" end="16" step="1">
						<input type="checkbox" id="2acheck-2-${i}" value="2acheck-2-${i}" name="A"/>
						<label for="2acheck-2-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="16" step="1">
						<input type="checkbox" id="2bcheck-2-${i}" value="2bcheck-2-${i}" name="A"/>
						<label for="2bcheck-2-${i}">${i}</label>
					</c:forEach> 
					<br>
					<c:forEach var="i" begin="1" end="22" step="1">
						<input type="checkbox" id="2acheck-3-${i}" value="2acheck-3-${i}" name="A"/>
						<label for="2acheck-3-${i}">${i}</label>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="22" step="1">
						<input type="checkbox" id="2bcheck-3-${i}" value="2bcheck-3-${i}" name="A"/>
						<label for="2bcheck-3-${i}">${i}</label>
					</c:forEach> 
				</div>
			</div>  
		</div>
	</c:if>
	
	<div style="text-align:center;margin-top:15px;">
		<button type="button" class="adBtn" onclick="history.back();">
			이전단계
		</button>
		<button type="submit" class="adBtn">
			다음단계
		</button>
	</div>
	<input type="hidden" name="sessionNum" value="${sessionNum }">
	<input type="hidden" name="hallNum" value="${hallNum }">
	</form>
</div>
