<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/exhibitBookForm.css" type="text/css">
<script type="text/javascript">
$(function(){ //���ڸ� �Է���� ��. 
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
				sl+=" "+$(this).val()+"��,"
			}
		});
		
		if(sl.length!=0){
			sl=sl.substring(0,sl.length-1);
			out+="<tr>";
			out+="<td class='selectList' colspan='4'>"+sl+" �����ϼ̽��ϴ�.</td>";
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
				out+="						<td width='100'>�⺻��</td>";
				out+="						<td width='50' class='mn'>"+Number(price).toLocaleString('en')+"��</td>";
				out+="						<td width='50' class='box'>";
				out+="							<select id='"+level+"normalP' name='normalP' onchange='selP("+level+");'>";
					for(var i=0;i<=count.val();i++){
				out+="									<option value='"+i+"'>"+i+"��</option>";
					}
				out+="							</select>";
				out+="						</td>";
				out+="					</tr>";
				out+="					<tr class='bb pricetr' data-type='dc' data-level="+level+" data-p="+(price/2)+">";
				out+="						<td>����������/����� ���ΰ� (���� 50% ����)</td>";
				out+="						<td class='mn'>"+Number(price/2).toLocaleString('en')+"��</td>";
				out+="						<td class='box'>";
				out+="							<select id='"+level+"halfP' name='halfP' onchange='selP("+level+");'>";
				for(var i=0;i<=count.val();i++){
					out+="							<option value='"+i+"'>"+i+"��</option>";
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
				customers+=" "+$(this).val()+"��,"
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
				<img src="<%=cp %>/resource/images/lumos/reviews_gray.png"> ����
				����
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
								<th>�Ⱓ</th>
								<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>
							</tr>
							<tr>
								<th>�ð�</th>
								<td>${dto.admitStart}~${dto.admitEnd}</td>
							</tr>
							<tr>
								<th>���</th>
								<td>${dto.hallName}&nbsp;${dto.exHallLocate}</td>
							</tr>
							<tr>
								<th>�������</th>
								<td>${dto.ratingName}</td>
							</tr>
							<tr>
								<th>�帣</th>
								<td>${dto.genre}</td>
							</tr>
							<tr>
								<th>����</th>
								<td>${dto.exPriceString}</td>
							</tr>
							<tr>
								<th>����</th>
								<td>${dto.host}</td>
							</tr>
							<c:if test="${dto.host!='lac' && not empty dto.supervise}">
								<tr>
									<th>�ְ�</th>
									<td>${dto.supervise}</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			
			<div style="clear: both;height: 30px;display: block;"></div>
			<div id="step1">
				<h2 class="linet" style="font-weight: 300;">�ż� ����</h2>
				<table class="audt" style="width:100%;margin: 10px 0;">
					<tr>
						<c:forEach items="${audienceList}" var="al" varStatus="als">
							<th width="100">${al.audience}</th>
							<td>
								<input type="text" class="form01" style="width: 70px;" data-al="${al.audienceLevelNum}" data-name="${al.audience}" data-price="${al.exPrice}" 
								name="audience${al.audienceLevelNum}" id="audience-${al.audienceLevelNum}" value="" placeholder="0">
							��
							</td>
							
						<c:if test="${als.isLast()}">
							</tr>
							<tr>
								<td colspan="${als.count*2}" style="text-align: right; padding-right: 10px;">
									�� <span id="totalcount">0</span>�� ����
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<div style="clear: both;height: 30px;display: block;"></div>
				<div style="width:250px; margin: 0 auto;">
				<button style="margin-right: 10px; float: left;" 
					onclick="location.href='<%=cp %>/exhibit/article?num=${dto.exhibitNum}'">����ϱ�</button>
				<button style="float: left;" onclick="go2();">��������</button>
				</div>

			</div>
			<div id="step2" style="display: none;">
				<h2 class="linet" style="font-weight: 300;">���� ����</h2>
				<table style="width: 100%;margin-bottom: 30px;" class="pricetable">
				</table>
			</div>
			
			<div style="clear: both;height: 30px;display: block;"></div>
			
			<div id="step3" style="display: none;">
				<h2 class="linet" style="font-weight: 300;">���ϸ��� ���</h2>
				<table style="width: 100%;" class="pricetable">
					<tr class="bb bt">
						<td width="174px" style="background-color: #eee;">��� ���ϸ���</td>
						<td style="text-align: right;" width="600">
							<input type="text" id="useMile" value="0">P</td>
						<td style="text-align: right;" >��밡�� ���ϸ��� : ${mile}</td>
					</tr>
				</table>
				
				<h2 class="linet" style="font-weight: 300; margin-top: 30px;">���� ����</h2>
				<table style="width: 100%;margin-bottom: 30px;" class="pricetable">
					<tr class="bb bt">
						<td style="text-align: left; background-color: #eee;">
						<input type="radio" checked="checked">�ſ�ī��</td>
					</tr>
				</table>
				<div style="width:250px; margin: 0 auto;">
				<button style="margin-right: 10px; float: left;" 
					>��������</button>
				<button style="float: left;" onclick="gogo();">�����ϱ�</button>
				</div>
			</div>
			
			<div class="war" style="clear: both;">
				<h2 style="font-weight: 300; margin-top: 30px;">���ǻ���</h2>
				- ������ �ʿ��� ���� (�����, ���������� ��)�� ���� ���, �ش��� ������ ���� ���� �ڷḦ �����ؾ� �ϸ� �������� ���ι��� ��ŭ ������ �����ؾ� �մϴ�.<br>
- ���� ������ ���� ���� ��� �� �翹���ϴ� �����̹Ƿ� ȯ�Ұ� ������ �����ᰡ �ΰ��˴ϴ�. (������ �翹�� ������ ����Ǵ� �������θ� ���� �����մϴ�.)<br>
- ��Ҽ������ ��� ���� ���ڴ� ��ǰ���� �ٸ���, ������ �ϴ� My���������� Ȯ�����ֽñ� �ٶ��ϴ�.<br>
- �¿��� �̿� �� ���� �ֺ��� ����ü���� ������ ȥ������ ���������� ����� �� �ֽ��ϴ�. ������ ���߱����� �̿����ֽñ� �ٶ��ϴ�. ������ ȥ�� �� ���� �Ұ��� ���� ��������, Ƽ��ȯ�� �Ұ��մϴ�.<br>
			</div>
			
			<div style="clear: both;height: 50px;display: block;"></div>
		</div>
	</div>
</div>

