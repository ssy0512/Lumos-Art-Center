<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitBookForm.css" type="text/css">
<script type="text/javascript">
$(function(){ //숫자만 입력토록 함. 
	$(document).on("keyup", "input.form01", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/gi,"")); 
	}); 
	
	$(document).on("blur", "input.form01", function() { 
		var sum=0;
		$("input.form01").each(function () {
			sum+=$(this).val()*1;
		});
		$("#totalcount").html(sum);
	}); 

	$("input").keypress(function(evt) {
			var fields = $("input:text");
			var index = fields.index(this);

			if (evt.keyCode == 13) {
				if (index > -1 && index < 5) {
					fields.eq(index + 1).focus();
				} else {
				}
				return false;
			}
		});
	});
	
	function go2() {
		if($("#totalcount").html()!=0){
			$("#step1").css("display","none");
		}
		
		var sl="";
		var out="";
		$("input.form01").each(function () {
			if($(this).val()!=0&&$(this).val()!=""){
				sl+=$(this).attr("data-name");
				sl+=" "+$(this).val()+"매,"
			}
		});
		
		if(sl.length!=0){
			sl=sl.substring(0,sl.length-1);
			out+="<tr>";
			out+="<td class='selectList' colspan='4'>"+sl+" 선택하셨습니다.</td>";
			out+="</tr>";			
			$("#step2 table").html(out);
		}
		
		out="";
		$("input.form01").each(function () {
			var totalcount = $("#totalcount").html()*1;
			var count = $(this);
			var price = $(this).attr("data-price");
			var level = $(this).attr("data-al");
			if($(this).val()!=0&&$(this).val()!=""){
				$("#step2").css("display","unset");
				$("#step3").css("display","unset");
				out+="					<tr class='pricetr' data-type='df' data-level="+level+" data-p="+price+">";
				out+="						<th width='70' class='head bb' rowspan='2'>"+$(this).attr("data-name")+"</th>";
				out+="						<td width='100'>기본가</td>";
				out+="						<td width='50' class='mn'>"+Number(price).toLocaleString('en')+"원</td>";
				out+="						<td width='50' class='box'>";
				out+="							<select id='"+level+"normalP' name='normalP' onchange='selP("+level+");'>";
					for(var i=0;i<=count.val();i++){
				out+="									<option value='"+i+"'>"+i+"매</option>";
					}
				out+="							</select>";
				out+="						</td>";
				out+="					</tr>";
				out+="					<tr class='bb pricetr' data-type='dc' data-level="+level+" data-p="+(price/2)+">";
				out+="						<td>국가유공자/장애인 할인가 (본인 50% 할인)</td>";
				out+="						<td class='mn'>"+Number(price/2).toLocaleString('en')+"원</td>";
				out+="						<td class='box'>";
				out+="							<select id='"+level+"halfP' name='halfP' onchange='selP("+level+");'>";
				for(var i=0;i<=count.val();i++){
					out+="							<option value='"+i+"'>"+i+"매</option>";
				}
				out+="							</select>";
				out+="						</td>";
				out+="					</tr>";
			}
		});
		$("#step2 table").append(out);
	}
	
	function selP(level) {
		//alert($("#"+level+"normalP").val());
	}
	
	function gogo() {
		var tsum=0;
		var p, count;
		
		var customers="";
		var total=0;
		$("input.form01").each(function () {
			if($(this).val()!=0&&$(this).val()!=""){
				customers+=$(this).attr("data-name");
				customers+=" "+$(this).val()+"매,"
				total+=$(this).attr("data-price")*$(this).val();
			}
		});
		if(customers.length!=0){
			customers=customers.substring(0,customers.length-1);
		}
		
		var discount=0;
		$("#step2 .pricetr").each(function () {
			p = $(this).attr("data-p");
			count=$(this).find("select").val();
			tsum+=(p*count);
		});
		tsum-=$("#useMile").val();
		discount=total-tsum;
		
		$("#customers").val(customers);
		$("#total").val(total);
		$("#discount").val(discount);
		
		var f = document.payForm;
		f.submit();
	}
	
</script>
<form name="payForm" action="<%=cp%>/bookExhibit/pay" method="post">
	<input type="hidden" id="customers" name="customers" value="">
	<input type="hidden" id="total" name="total" value="">
	<input type="hidden" id="discount" name="discount" value="">
	<input type="hidden" name="num" value="${dto.exhibitNum}">
</form>
<div>
	<div class="wrap">
		<div class="titleDiv">
			<h1 class="title" style="margin-top: 60px;">
				<img src="<%=cp %>/resource/images/lumos/reviews_gray.png"> 전시
				예매
			</h1>
			<div class="poster left">
				<c:if test="${not empty dto.exProfileImage}">
					<img class="list_image_crop" src="<%=cp %>/uploads/image/${dto.exProfileImage}">
				</c:if>
				<c:if test="${empty dto.exProfileImage}">
					<img class="list_image_crop" src="<%=cp%>/resource/images/lumos/noposter.png">
				</c:if>
			</div>
			<div class="exInfo">
				<div class="content right">
					<h2>${dto.exhibitName}</h2>
					<table class="detail_inform">
						<tbody>
							<tr>
								<th>기간</th>
								<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>
							</tr>
							<tr>
								<th>시간</th>
								<td>${dto.admitStart}~${dto.admitEnd}</td>
							</tr>
							<tr>
								<th>장소</th>
								<td>${dto.hallName}&nbsp;${dto.exHallLocate}</td>
							</tr>
							<tr>
								<th>관람등급</th>
								<td>${dto.ratingName}</td>
							</tr>
							<tr>
								<th>장르</th>
								<td>${dto.genre}</td>
							</tr>
							<tr>
								<th>가격</th>
								<td>${dto.exPriceString}</td>
							</tr>
							<tr>
								<th>주최</th>
								<td>${dto.host}</td>
							</tr>
							<c:if test="${dto.host!='lac' && not empty dto.supervise}">
								<tr>
									<th>주관</th>
									<td>${dto.supervise}</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			<div style="clear: both;height: 30px;display: block;"></div>
			<div id="step1">
				<h2 class="linet" style="font-weight: 300;">매수 선택</h2>
				<table class="audt" style="width:100%;margin: 10px 0;">
					<tr>
						<c:forEach items="${audienceList}" var="al" varStatus="als">
							<th width="100">${al.audience}</th>
							<td>
								<input type="text" class="form01" style="width: 70px;" data-al="${al.audienceLevelNum}" data-name="${al.audience}" data-price="${al.exPrice}" 
								name="audience${al.audienceLevelNum}" id="audience-${al.audienceLevelNum}" value="" placeholder="0">
							매
							</td>
							
						<c:if test="${als.isLast()}">
							</tr>
							<tr>
								<td colspan="${als.count*2}" style="text-align: right; padding-right: 10px;">
									총 <span id="totalcount">0</span>매 선택
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<div style="clear: both;height: 30px;display: block;"></div>
				<div style="width:250px; margin: 0 auto;">
				<button style="margin-right: 10px; float: left;" 
					onclick="location.href='<%=cp %>/exhibit/article?num=${dto.exhibitNum}'">취소하기</button>
				<button style="float: left;" onclick="go2();">다음으로</button>
				</div>

			</div>
			<div id="step2" style="display: none;">
				<h2 class="linet" style="font-weight: 300;">가격 선택</h2>
				<table style="width: 100%;margin-bottom: 30px;" class="pricetable">
				</table>
			</div>
			
			<div style="clear: both;height: 30px;display: block;"></div>
			
			<div id="step3" style="display: none;">
				<h2 class="linet" style="font-weight: 300;">마일리지 사용</h2>
				<table style="width: 100%;" class="pricetable">
					<tr class="bb bt">
						<td width="174px" style="background-color: #eee;">사용 마일리지</td>
						<td style="text-align: right;" width="600">
							<input type="text" id="useMile" value="0">P</td>
						<td style="text-align: right;" >사용가능 마일리지 : ${mile}</td>
					</tr>
				</table>
				
				<h2 class="linet" style="font-weight: 300; margin-top: 30px;">결제 수단</h2>
				<table style="width: 100%;margin-bottom: 30px;" class="pricetable">
					<tr class="bb bt">
						<td style="text-align: left; background-color: #eee;">
						<input type="radio" checked="checked">신용카드</td>
					</tr>
				</table>
				<div style="width:250px; margin: 0 auto;">
				<button style="margin-right: 10px; float: left;" 
					>이전으로</button>
				<button style="float: left;" onclick="gogo();">결제하기</button>
				</div>
			</div>
			
			<div class="war" style="clear: both;">
				<h2 style="font-weight: 300; margin-top: 30px;">유의사항</h2>
				- 증빙이 필요한 할인 (장애인, 국가유공자 등)을 받은 경우, 해당자 본인이 직접 증빙 자료를 제시해야 하며 미지참시 할인받은 만큼 차액을 지불해야 합니다.<br>
- 예매 변경은 결제 건을 취소 후 재예매하는 절차이므로 환불과 동일한 수수료가 부과됩니다. (할인은 재예매 시점에 적용되는 할인율로만 적용 가능합니다.)<br>
- 취소수수료와 취소 가능 일자는 상품별로 다르니, 오른쪽 하단 My예매정보를 확인해주시기 바랍니다.<br>
- 승용차 이용 시 전당 주변의 교통체증과 주차장 혼잡으로 정시입장이 어려울 수 있습니다. 가급적 대중교통을 이용해주시기 바랍니다. 주차장 혼잡 및 입차 불가로 인한 지연입장, 티켓환불 불가합니다.<br>
			</div>
			
			<div style="clear: both;height: 50px;display: block;"></div>
		</div>
	</div>
</div>

