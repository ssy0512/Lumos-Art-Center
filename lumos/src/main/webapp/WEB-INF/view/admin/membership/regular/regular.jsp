<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
</script>

<div class="body-right" style="width: 1380px; height: 800px;">

	<div>
		<table style="width: 1380px; margin: 20px auto 0px;">
			<tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
	</div>

	<div style="clear: both; margin-top: 30px;">
		<table>
			<thead style="background-color: #efefef;">
				<tr style="height:30px;">
					<th style="width: 100px;">회원번호</th>
					<th style="width: 200px;">회사명</th>
					<th style="width: 100px;">사업자번호</th>
					<th style="width: 100px;">담당자명</th>
					<th style="width: 150px;">담당자 번호</th>
					<th style="width: 200px;">이메일</th>
					<th style="width: 150px;">팩스</th>
					<th style="width: 200px;">주소</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	
</div>