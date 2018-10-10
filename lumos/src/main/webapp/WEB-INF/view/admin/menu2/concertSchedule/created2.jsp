<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

 <script type="text/javascript">
 function sendOk(){
	 var f=document.createdForm;
	 var str=f.concertName.value;
	 if(!str){
		 alert("공연명을 입력하십시오.");
		 f.academyName.focus();
		 return;
	 }
	 
	 str=f.concertStart.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.concertStart.focus();
		 return;
	 }
	 str=f.concertEnd.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.concertEnd.focus();
		 return;
	 }

	 f.action="<%=cp%>/admin/menu2/concertSchedule/${mode}";
	 f.submit();
 }
 
 $(function(){
	$("#regDate").datepicker({
		dateFormat:"yy-mm-dd",
		minDate:"today",
		maxDate:"+1Y",
		closeText:"닫기",
		dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showOtherMonths:false,
		selectOtherMonths:true,
		changeMonth:true,
		changeYear:true
	}) ;
 });
 
 </script>
 
 
 
<div class="body-right" style="width: 700px; padding-top:50px; padding-left:30px">
    <div class="body-title" >
        <h3><span style="font-family: Webdings">2</span> 공연 회차 등록 </h3>
        <hr>
    </div>
    
    <div style="clear:both;">
			<form name="createdForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      
		  
  		<tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">회차 날짜 입력</td>
			      <td style="padding-left:10px;"> 
			            <input type="text" id="regDate" name="sessionDate" readonly="readonly" value="${dto.sessionDate}"><button></button>
			      </td>
			  </tr>
			
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">회차 시간</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="sessionTime" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.sessionTime}">
			      </td>
			  </tr>
			  
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/article';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="sessionDate" value="${dto.sessionDate}">
			         	 <input type="hidden" name="sessionTime" value="${dto.sessionTime}">
			         	 <input type="hidden" name="page" value="${dto.page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>