<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

 <script type="text/javascript">
 function sendOk(){
	 var f=document.createdForm;
	 var str=f.academyName.value;
	 if(!str){
		 alert("강의명을 입력하십시오.");
		 f.academyName.focus();
		 return;
	 }
	 
	 str=f.startDay.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.startDay.focus();
		 return;
	 }
	 str=f.endDay.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.endDay.focus();
		 return;
	 }
	 str=f.startTime.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.startTime.focus();
		 return;
	 }
	 str=f.endTime.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.endTime.focus();
		 return;
	 }
	 str=f.price.value;
	 if(!str){
		 alert("시작일을 입력하십시오.");
		 f.price.focus();
		 return;
	 }
	 
	 str=f.startTime.value;
	 if(!str){
		 alert("시작 시간을 입력하십시오.");
		 f.startTime.focus();
		 return;
	 }
	 
	 var mode="${mode}";
	 if(mode=="created"|| mode=="update" && f.upload.value!=""){
		 if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)){
			 alert('등록 가능한 파일 형식이 아닙니다. 다른 파일을 이용하세요.');
			 f.upload.focus();
			 return;
		 }
	 }
	 f.action="<%=cp%>/admin/menu2/academySchedule/${mode}";
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
 
 $(function(){
		$("#regDate2").datepicker({
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
        <h3><span style="font-family: Webdings">2</span> 강의 일정 등록 </h3>
        <hr>
    </div>
    
    <div style="clear:both;">
			<form name="createdForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">강의명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="academyName" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.academyName}">
			      </td>
			  </tr>
			
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">강의실 선택</td>
		      <td style="padding-left:10px;"> 
		      <select class="selectField" name="" id="listRoom">
		      	<c:forEach var="vo" items="${listRoom}">
		      		<!-- <option value="">::선택::</option> -->
		      		<option value="${vo.roomNum}">${vo.roomName}</option>
		      	</c:forEach>
		      </select>
		      </td>
		  </tr>
		  
		  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">강사 선택</td>
		      <td style="padding-left:10px;"> 
		      <select class="selectField" name="" id="listInst">
		      	<c:forEach var="vo" items="${listInst}">
		      		<!-- <option value="">::선택::</option> -->
		      		<option value="${vo.instNum}">${vo.instName}</option>
		      	</c:forEach>
		      </select>
		      </td>
		  </tr>
  		<tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">강의시작일</td>
			      <td style="padding-left:10px;"> 
			            <input type="text" id="regDate" name="startDay" readonly="readonly" value="${dto.startDay}"><button></button>
			            ~
			            <input type="text" id="regDate2" name="endDay" readonly="readonly" value="${dto.endDay}"><button></button>
			      </td>
			  </tr>
			  
		<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">강의일자</td>
		      <td style="padding-left:10px;"> 
		      <select class="selectField" name="lectureDay">
		      	<option value="">::선택::</option>
		      	<option value="월요일" ${dto.lectureDay=="월요일" ? "selected='selected'":""}>월요일</option>
		      	<option value="화요일" ${dto.lectureDay=="화요일" ? "selected='selected'":""}>화요일</option>
		      	<option value="수요일" ${dto.lectureDay=="수요일" ? "selected='selected'":""}>수요일</option>
		      	<option value="목요일" ${dto.lectureDay=="목요일" ? "selected='selected'":""}>목요일</option>
		      	<option value="금요일" ${dto.lectureDay=="금요일" ? "selected='selected'":""}>금요일</option>
		      	<option value="토요일" ${dto.lectureDay=="토요일" ? "selected='selected'":""}>토요일</option>
		      </select>
		      </td>
		  </tr>			
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">시작시간</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="startTime" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.startTime}">
			      </td>
			  </tr>
			  	<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">종료시간</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="endTime" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.endTime}">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">가&nbsp;&nbsp;격</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="price" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.price}">원
			      </td>
			  </tr>
			  	  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">총횟수</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="totalCount" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.totalCount}">회
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">강의이미지</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53"
			                     accept="image/*" 
			                     style="height: 25px;">
			       </td>
			  </tr>
			  

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/academySchedule/academylist';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="academyName" value="${dto.academyName}">
			         	 <input type="hidden" name="startDay" value="${dto.startDay}">
			         	 <input type="hidden" name="endDay" value="${dto.endDay}">
			         	 <input type="hidden" name="lectureDay" value="${dto.lectureDay}">
			         	 <input type="hidden" name="startTime" value="${dto.startTime}">
			         	 <input type="hidden" name="endTime" value="${dto.endTime}">
			         	 <input type="hidden" name="totalCount" value="${dto.totalCount}">
			         	 <input type="hidden" name="price" value="${dto.price}">
			         	 <input type="hidden" name="acProfileImage" value="${dto.acProfileImage}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>