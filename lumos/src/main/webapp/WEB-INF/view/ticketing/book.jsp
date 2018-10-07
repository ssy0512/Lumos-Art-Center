<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/ticketingLayout.css" type="text/css">
<script type="text/javascript">

</script>

<div class="body-container">
	<h3 class="title">가격</h3>
	<c:if test="${rcnt!=0 }">
		<div>
			<p  class="count">
				<a style="font-weight:bold;">R석 | </a> 
				<span>좌석 ${rcnt }매를 선택하셨습니다.</span>
			</p>
			<table style="width: 100%;table-layout: fixed;word-break: break-all;">
				<tr>
					<td style="width:110px;height:28px;text-align:center">기본가</td>
					<td style="padding-left:9px;">일반</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${dto.rprice }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tcnt" class="selectField" style="height:28px;width: 50px;">
			                  <option value="r-0">0매</option>
			                  <c:forEach var="i" begin="1" end="rcnt" step="1">
			                  	<option value="r-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="text-align:center;">기본할인</td>
					<td>장애인/국가유공자 할인 50%</td>
					<td>${dto.rprice /2 }원</td>
					<td>
						<select name="salercnt" class="selectField" style="height:28px;width: 50px;">
			                  <option value="r-0">0매</option>
			                  <c:forEach var="i" begin="1" end="rcnt" step="1">
			                  	<option value="r-sale-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<c:if test="${scnt!=0 }">
		<div>
			<p  class="count">
				<a style="font-weight:bold;">S석 | </a> 
				<span>좌석 ${scnt }매를 선택하셨습니다.</span>
			</p>
			<table style="width: 100%;table-layout: fixed;word-break: break-all;">
				<tr>
					<td style="width:110px;height:28px;text-align:center">기본가</td>
					<td style="padding-left:9px;">일반</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${dto.sprice }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tscnt" class="selectField" style="height:28px;width: 50px;">
			                  <option value="s-0">0매</option>
			                  <c:forEach var="i" begin="1" end="scnt" step="1">
			                  	<option value="s-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="text-align:center;">기본할인</td>
					<td>장애인/국가유공자 할인 50%</td>
					<td>${dto.sprice /2 }원</td>
					<td>
						<select name="slaescnt" class="selectField" style="height:28px;width: 50px;">
			                  <option value="s-0">0매</option>
			                  <c:forEach var="i" begin="1" end="scnt" step="1">
			                  	<option value="s-sale-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<c:if test="${acnt!=0 }">
		<div>
			<p  class="count">
				<a style="font-weight:bold;">A석 | </a> 
				<span>좌석 ${acnt }매를 선택하셨습니다.</span>
			</p>
			<table style="width: 100%;table-layout: fixed;word-break: break-all;">
				<tr>
					<td style="width:110px;height:28px;text-align:center">기본가</td>
					<td style="padding-left:9px;">일반</td>
					<td style="text-align:right;padding-right:9px;width:100px;">${dto.aprice }원</td>
					<td style="text-align:center;width:100px;">
						<select name="tacnt" class="selectField" style="height:28px;width: 50px;">
			                  <option value="a-0">0매</option>
			                  <c:forEach var="i" begin="1" end="acnt" step="1">
			                  	<option value="a-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="text-align:center;">기본할인</td>
					<td>장애인/국가유공자 할인 50%</td>
					<td>${dto.aprice /2 }원</td>
					<td>
						<select name="tcnt" class="selectField" style="height:28px;width: 50px;">
			                  <option value="a-0">0매</option>
			                  <c:forEach var="i" begin="1" end="acnt" step="1">
			                  	<option value="a-sale-${i}">${i}매</option>
			                  </c:forEach>
			            </select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
</div>