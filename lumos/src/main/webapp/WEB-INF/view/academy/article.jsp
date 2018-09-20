<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>

<style type="text/css">

.imgLayout {
    height: 100%;
    margin: 30px 30px 30px 30px;
    background-color: #fff;
}

</style>

<script type="text/javascript">
function updateAcademy() {
  var academyNum = "${dto.academyNum}";
  var page = "${page}";
  var query = "academyNum="+academyNum+"&page="+page;
  var url = "<%=cp%>/academy/update?"+query+"&mode=${dto.mode}";
  
  location.href=url;	
  
}

function lectureAcademy() {
	  var academyNum = "${dto.academyNum}";
	  var page = "${page}";
	  var query = "academyNum="+academyNum+"&page="+page;
	  var url = "<%=cp%>/academy/mylecture?"+query;
	  
	  location.href=url;	
	  
	}

function finishClass() {
	alert("수강신청이 끝났습니다.");
}

</script>

<div class="body-content-container-a">
     <div class="body-academy-title">
         <span class="academy-title">아카데미 수강신청</span>
	         <c:if test="${sessionScope.member.userId=='admin'}">
	        	 <button type="button" class="btn-info" onclick="updateAcademy();">아카데미 관리</button>
	         </c:if>
     </div>  
     
     <div>		
		<div class="imgLayout" style="width: 1020px; height: 550px; border-bottom: 1px solid #ccc;">
             <img src="<%=cp%>/resource/images/france.jpg" width="240" height="180" border="0" onclick="javascript:article('${dto.academyNum}');">
             	<div class="academy_desc3">	
                   	<p class="academy_desc3-title">
                   		<span>${dto.academyName}</span> 
                   	</p>
             		<p class="font13">강사<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${dto.instName}</span></p>		
             		<p class="font13">요일.시간
             			<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;(${dto.lectureDay}) ${dto.startTime}~${dto.endTime}</span></p>	  
             		<p class="font13">수강기간
             			<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${dto.startDate}(${dto.lectureDay})~${dto.endDate}(${dto.lectureDay})</span></p>
             		<p class="font13">장소<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${dto.position} | ${dto.roomName}</span></p>  
             		<p class="font13">모집정원<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;${dto.totalCount} 명</span></p> 
             		<p class="font13">수강료
             			<span style="width: 500px; font-weight: 500; text-decoration: none; float: right;">| &nbsp;<span class="format-money" style="color: #aa1717;">
             				<fmt:formatNumber value="${dto.price}" pattern="#,###"/> 원</span>
             			</span></p>
             	</div>  
             	      
	             	<div style="width: 240px; float: left; margin: 30px 0px 30px 0px;">
	           		<c:if test="${dto.mode=='finish'}">
	             		<p class="list-ing" style="color:darkgrey; background-color: #ffffff; border: 1px solid darkgrey;
	             								height:40px; padding: 10px 15px 5px 15px;"><span>마&nbsp;감</span></p> 	             	
	                </c:if>                	 
		             	<c:if test="${dto.mode=='ing'}">		
		                	<p class="list-ing" style="height:40px; padding: 10px 15px 5px 15px;"><span>접수중</span></p>  	
		                </c:if>
	             	</div>      		             	
                		                   	
             	<div class="academy_desc4">	
                   	<p style="padding: 20px 0px; margin-bottom: 10px; font-size: 20px; font-weight: bold;">
                   	  	수강신청하기
                   	</p>
                <c:if test="${sessionScope.member!=userId}">    	
                   	<p style="border-top: 1px solid #666; border-bottom: 1px solid #666; padding: 20px 10px; font-size: 20px; font-weight: bold;">
                   	  	결제정보
                   	  	<span style="float: right; color: #aa1717; padding-bottom: 10px;">${dto.price}원</span>
                   	</p>
               		
               		<c:if test="${dto.mode=='ing'}">
	                   	<p style="padding: 20px 0px 10px; font-size: 20px; text-align: center;">
	                   	  	 <button type="button" class="btn-Count" onclick="lectureAcademy();">수&nbsp;강&nbsp;신&nbsp;청</button>
	                   	  	 <input type="hidden" name="academyNum" value="${dto.academyNum}">
	                   	</p>
             		</c:if>      	
                   	<c:if test="${dto.mode=='finish'}">
	                   	<p style="padding: 20px 0px 10px; font-size: 20px; text-align: center;">
	                   	  	 <button type="button" class="btn-Count" style="color: darkgrey; background-color: #ffffff; border: 1px solid darkgrey;" onclick="finishClass();">마&nbsp;&nbsp;&nbsp;감</button>
	                   	</p>
                   	</c:if>
                   	
                </c:if>   	                   	                   	
                   	
                <c:if test="${empty sessionScope.member}">   	
	             	<p style="border-top: 1px solid #666; border-bottom: 1px solid #666; text-align: center; font-size: 20px; margin: 10px; padding: 20px;">
                   	  	<a href="<%=cp%>/member/login">로그인이 필요 합니다.</a>
                   	</p>
                </c:if>   	
             	</div>
             	
             	<div>
             		<table style="width: 240px; height: 125px;">
             			<tr style="text-align: center; height: 30;">
	             			<th colspan="2" style="border: 1px solid #ccc; text-align: center; font-weight: 400; background-color: whitesmoke;">모집현황</th>	             			
             			</tr>
             			<tr style="text-align: center;">
	             			<td style="border: 1px solid #ccc;">신청 0명</td>
	             			<td style="border: 1px solid #ccc;"> 정원 ${dto.totalCount}명</td>
             			</tr>
             		</table>
             	</div>      	
         </div>		
     </div>
     <div style="width: 1020px; height: 100%">
	     <table style="width: 1020px; height: 100%;">
			<tr>
				<td>${dto.classInfo}</td>
			</tr>             		
	     </table>
     </div>
</div>

