<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function() {
    $("input[name=startDay]").datepicker();
    $("input[name=endDay]").datepicker();
});
</script>

<form name="schedulerForm" method="post">
<table style="margin: 10px auto 0px; width: 100%; border-spacing: 0px;">
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">구&nbsp;&nbsp;분</td>
		      <td> 
                    <select name="groupNum" class="selectField" onchange="changeGroup('', '');">
                    	<c:forEach var="vo" items="${groupList}">
                    	   <option value="${vo.locationNum}">${vo.kind}</option>
                    	</c:forEach>
                    </select>
              </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">항&nbsp;&nbsp;목</td>
		      <td> 
                    <select name="resourceNum" class="selectField"></select>
              </td>
	  </tr>
		<tr height="40"> 
		      <td width="50" style="font-weight:600; padding-right:15px; text-align: right;">위&nbsp;&nbsp;치</td>
		      <td> 
                     <input name='exchallLocate' type='text' class='boxTF' style="width:55%;" placeholder='위치'>
              </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">제&nbsp;&nbsp;목</td>
		      <td> 
                     <input name='title' type='text' class='boxTF' style="width:90%;" placeholder='제목'>
              </td>
	  </tr>

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">작성자</td>
		      <td> 
		             ${sessionScope.member.userName}
		      </td>
	  </tr>
		  

	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">시작일자</td>
		      <td> 
		        	<input name="startDay" type="text" readonly="readonly" class="boxTF" style="background: #fff; width: 120px;" placeholder="시작일자">
		        	<input id="startTime" name="startTime" type="text" class="boxTF" style="width: 120px;" placeholder="시작시간">
		      </td>
	  </tr>
		  
	  <tr height="40"> 
		      <td width="100" style="font-weight:600; padding-right:15px; text-align: right;">종료일자</td>
		      <td> 
		        	<input name="endDay" type="text" readonly="readonly" class="boxTF" style="background: #fff; width: 120px;" placeholder="종료일자">
		        	<input id="endTime" name="endTime" type="text" class="boxTF" style="width: 120px;" placeholder="종료시간">
		      </td>
	  </tr>

	  
</table>
</form>