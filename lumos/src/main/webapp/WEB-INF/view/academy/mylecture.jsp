<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academylayout.css" type="text/css">
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

	
</script>


<div class="body-content-container-a">
     <div class="body-academy-title">
         <span class="academy-title">수강결제 정보</span>
     </div>  
     
     <div class="imgLayout" style="width: 1020px; height: 400px; border-bottom: 1px solid darkgrey;">
     	<div>
     		<img src="<%=cp%>/resource/images/france.jpg" width="240" border="0">
     		
     		<table style="width:700px; float: right;">
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				수강자
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">${sessionScope.member.userName}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				강의명
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">${dto.academyName}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				강의 요일.시간 
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">(${dto.lectureDay}) ${dto.startTime}~${dto.endTime}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				강의 시작일 
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">${dto.startDate}</td>
     			</tr>
     			<tr>
     			  <td width="150px" height="50px" style="background-color: whitesmoke;">
     				<p style="font-size: 14px; font-weight: bold; padding-left: 15px;">
           				수강료
					</p>
       			  </td>
       			  <td width="500px" style="padding-left: 15px;">
       			  <fmt:formatNumber value="${dto.price}" pattern="#,###"/> 원</td>
     			</tr>
     			<tr>
     			  <td colspan="2" width="150px" height="50px">
     				<p style="padding: 20px 0px 10px; font-size: 20px; text-align: center;">
	                   <button type="button" class="btn-Count" onclick="javascript:location.href='<%=cp%>/academy/mylecture';">결&nbsp;&nbsp;&nbsp;제</button>
	                </p>
       			  </td>
     			</tr>
			</table>
        </div> 
        	<div style="width: 240px; padding: 10px 20px 50px 0px; float: none;">	
            	<p style="font-size: 20px; font-weight: bold; padding-top: 10px;">
                	${dto.academyName}
                </p>
            </div>
            
            <div class="academy_desc3" style="width: 320px; padding: 10px 20px 20px 0px; float: none; margin: 0px;">
            	<table>
            		<tr>
            			<td class="font12" width="200px">강사</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;${dto.instName}</td>
            		</tr>
            		<tr>
            			<td class="font12" width="200px">요일.시간</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;(${dto.lectureDay}) ${dto.startTime}~${dto.endTime}</td>
            		</tr>	
            		<tr>
            			<td class="font12" width="200px">수강기간</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;${dto.startDate}(${dto.lectureDay})~${dto.endDate}(${dto.lectureDay})</td>
            		</tr>
            		<tr>
            			<td class="font12" width="200px">장소</td>
            			<td class="font12" style="width: 550px; font-weight: 600; text-decoration: none;">| &nbsp;${dto.position} | ${dto.roomName}</td>
            		</tr>
            	</table>	
            </div>
            <div>
        </div> 
     </div>
</div>
<div style="width:1020px; height: 300px; margin: 20px auto;">
	<div class="body-academy-title" style="width: 240px;">
		<span>결제 전 유의사항</span>
	</div> 
	<table style="width:666px; float: right;">
		<tr>
			<td width="150px" height="50px" style="background-color: #999;">
				<p style="font-size: 15px; color:#ffffff; font-weight: bold; text-align: center;">
           				구분
				</p>
			</td>
			<td width="150px" height="50px" style="background-color: #999;">
				<p style="font-size: 15px; color:#ffffff; font-weight: bold; text-align: center;">
           				환불 수수료
				</p>
			</td>
			<td width="150px" height="50px" style="background-color: #999;">
				<p style="font-size: 15px; color:#ffffff; font-weight: bold; text-align: center;">
           				비고
				</p>
			</td>
		</tr>
		<tr>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				구분
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				환불 수수료
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				비고
				</p>
			</td>
		</tr>
		<tr>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				구분
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				환불 수수료
				</p>
			</td>
			<td width="150px" height="50px">
				<p style="font-size: 14px; color: #434343; font-weight: bold; text-align: center;">
           				비고
				</p>
			</td>
		</tr>
	</table>
</div>