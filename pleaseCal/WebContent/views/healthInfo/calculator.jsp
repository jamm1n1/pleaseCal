<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 계산기/일일 권장 영양 섭취 계산기</title>
<style>
.frms input[type="text"], select {
	background: none repeat scroll 0 0 #fff;
	border: 1px solid #ddd;
	border-radius: 0.35em;
	height: 35px;
	margin-bottom: 15px;
	margin-top: 5px;
	padding: 0 0.5%;
	width: 90%;
}

.hidden{
	display:none;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body>
	<jsp:include page = "../common/menu.jsp"/>

	<div class="container px-4 px-lg-5 mt-5" align='center' style=background:#f8f8f8 >
		<table id ='tab' align='center' style="width:60%;">
			<tr>
				<td align=center><h3>일일 권장 칼로리 계산기</h3>
				<form id ="frm" name="frm" action="<%=request.getContextPath()%>/calResult.do" method="post" class='frms noborders'>
				<input type="hidden" name="no" value="${userNo}">
				<table>
					<tr>
						<td>
							<p>나이 : </p>
						</td>
						<td>
							<input type="text" name="age" id="age" align="left" size="3" maxlength="2" onKeyPress="return cknum(event,age)">
						</td>
						<td>
							<p>세</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>성별 : </p>
						</td>
						<td>
							
							<input type="radio" class="btn-check" name="gen" id="gen1" value="M" checked> 
							<label class="btn btn-outline-dark btn-sm" for="gen1">남성</label>
							<input type="radio" class="btn-check" name="gen" id="gen2" value="F">
							<label class="btn btn-outline-dark btn-sm" for="gen2">여성</label>
	
						</td>
					</tr>
					
					<tr>
						<td>
							<p>키 : </p>
						</td>
						<td><input type="text" name="cen" id="cen" size="4" ></td>
					</tr>
					<tr>
						<td>
							<p>몸무게 : </p>
						</td>
						<td><input type="text" name="weight" id="weight" maxlength="3" size="3"></td>
						<td>
						
							<p id="kg">kg</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>활동량 : </p>
						</td>
						<td>
							<select style='width:150px;' name="loa" id="loa">
								<option value="1">좌식</option>
								<option value="2">가벼운활동(주 1~3일)</option>
								<option value="3" >중간정도운동(주 3~5일)</option>
								<option value="4">많은운동(주6~7일)</option>
								<option value="5">매우힘든운동(스포츠 및 육체노동)</option>
							</select>
						</td>
						<td>
						<c:choose> 
	                    	<c:when test="${userNo ne '0' && check eq 'Y'}">
	                    		<button type="button" id="delete" class="btn btn-outline-danger btn-sm" > 정보삭제 </button>
	                    	</c:when> 
	                    	<c:when test= "${userNo ne '0' && check eq 'N'}">
	                    		<button type="button" id="save" class="btn btn-outline-success btn-sm"> 정보저장 </button>
	                    	</c:when> 
                   		</c:choose>
                   		</td>
                    </tr>
				</table>
				</form>
			
				<br>
				<button type="button" id="result" class="btn btn-primary"> 칼로리 계산 </button>
				<table align="center" class="frms noborders">
			
					<tr>
						<td align="right">
							<p>일일 권장 칼로리 : </p>
						</td>
						<td>
							<input type="text" id="rc" style="font-size:13px;" size="15" readonly>
						</td>
						<td>
							<p>kcal</p>
						</td>
					</tr>
				</table>
			
				<div>
					<p>▼일일 권장 영양 섭취▼</p>
				</div>
				
		   		
		   		<table class="frms noborders">
				<tr>
					<td>
						<p>지방 : </p>
					</td>
					<td>
						<input type="text" id="rf" size="10" readonly>
					</td>
					<td>
						<p>g</p>
					</td>
					
				</tr>
				<tr>
					<td>
						<p>단백질 : </p>
					</td>
					<td>
						<input type="text" id="rp" size="10" readonly>
					</td>
					<td>
						<p>g</p>
					</td>
					
				</tr>
				<tr>
					<td>
						<p>탄수화물 : </p>
					</td>
					<td>
						<input type="text" id="rh" size="10" readonly>
					</td>
					<td>
						<p>g</p>
					</td>
					
				</tr>
				
			</table>
		</div>
	</table>
	</div>

	<section class="py-5">
       <div class="container px-4 px-lg-5 mt-5" align='center' style=background:#f8f8f8 >
       	   <h3>추천상품</h3>
       	   <br>
           <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
           		<!-- 추천상품 삽입 -->
           </div>
       </div>
   </section>

	<script>
		
		$(function(){
		
			let userNo = ${userNo}
			
			if(userNo != 0) { // 회원일때 값이 있으면 불러오기
				
				$.ajax({
					
					url: "selectHealthInfo.do",
					
					type: "post",
					
					data: {
						no: userNo
					},
					
					success:function(h){
						
						$('input[id=age]').attr('value',h.age);
						//$("#age").val(h.age);
						$("#cen").val(h.height);
						$("#weight").val(h.weight);
						$('#loa').val(h.active).prop("selected",true);
						$(":radio[name='gen'][value='" + h.gen + "']").attr('checked', true);

					},
					
				
				})
				

			} else {
				alert("회원으로 이용시 정보 저장이 가능합니다")
			}
			
			
			$.ajax({
				
   		   		url: "ranListProduct.do",
   		   		
   		   		type: "get",
   		   		
   		   		success:function(list){
   		   	
   		   			let value = "";

   		   			for(var i in list){
   		   				

						value += '<div class="col mb-5">'+
						'<div class="card h-100">'+
						'<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+'" alt="상품이미지" /></a>'+
						'<div class="card-body p-4">'+
						'<div class="text-center">'+
						'<h5 class="fw-bolder">'+list[i].pName+'</h5>'+list[i].pPrice+'</div>'+
						'</div>'+
						'<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'+
						'<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'">상세정보</a></div>'+
						'</div></div></div>';

   		   				
					}
   		   			
					$("#list").html(value);
   		   		},
   		   		
   		   		error:function(){
   		   			console.log("ajax통신실패");
   		   		}
   	   		})
			
		})
		
		$('#save').click(function(){
			
			let age = parseInt($("#age").val());
			let cm = $("#cen").val();
			let weight= $("#weight").val();
			
			if (age!='' && cm!='' && weight!='') {
				$("#frm").attr("action", "<%=request.getContextPath()%>/calResult.do");
				$("#frm").submit();
			} else {
				alert("값을 모두 입력하세요");
				false;
			}
			
		})
		
		$('#delete').click(function(){
			
			if(confirm("정말 삭제하시겠습니까?")) {
				$("#frm").attr("action", "<%=request.getContextPath()%>/deleteHealthInfo.do");
				$("#frm").submit();
			}
			
		})
		
		
	
		$('#result').click(function(){
			
			let cneed; // 활동량을 통한 칼로리요구량
			let fneed; // 지방
			let crneed; // 탄수화물
			let pneed; // 단백질
			let bmr; // 비만도
			
			// 나이, 키(cm), 몸부계
			let age = parseInt($("#age").val());
			let cm = $("#cen").val();
			let weight= $("#weight").val();
			
			if (age!='' && cm!='' && weight!='') {
				
				// 남여체크에 따른 BMR계산 -> 기초대사율
				if($('input[name=gen]:checked').val() == 'M') {
					bmr=66.5 + (13.75 * weight) + (5.003 * cm) - (6.75 * age);
				} else {
					bmr=655.1 + (9.563 * weight) + (1.850 * cm) - (4.676 * age);
				}
				
				let loa=$('#loa').val(); // 활동량 체크 값
				// Harris-Benedict 방정식 -> 총 일일 칼로리 요구량을 결정
				// https://www.omnicalculator.com/health/bmr-harris-benedict-equation
				switch(loa) {
					case "1":
					cneed=bmr*1.2;
					break;
					case "2":
					cneed=bmr*1.375
					break;
					case "3":
					cneed=bmr*1.55;
					break;
					case "4":
					cneed=bmr*1.725;
					break;
					case "5":
					cneed=bmr*1.9;
					break;
				}
				
				// 칼로리 소수점정리
				cneed=Math.floor(cneed);
				
				// 열량 -> g 변환
				fneed=Math.floor((cneed*0.2)/9); // 지방
				pneed=Math.floor((cneed*0.4)/4); // 단백질
				crneed=Math.floor((cneed*0.4)/4); // 탄수화물
				$("#rc").val(" "+cneed); // 칼로리
				$("#rf").val(" "+fneed); // 지방
				$("#rp").val(" "+pneed); // 단백질
				$("#rh").val(" "+crneed); // 탄수화물
				

			} else {
				alert("값을 모두 입력하세요");
				
			}

		})
			
		function cknum(event,num) {
			
			let key = event.keyCode; // 숫자를 누를때 찍히는 이벤트번호
			
			console.log(event.keyCode)
	
			let val = num.value; // 나이입력칸의 값
			
			if(key == 48) { // 0 입력시
				
				if(val=="") { // 빈값에서 처음 0 입력시 
					return false; // 불가
				} else {
					return true;
				}
				
			}
			
			if (key < 49 || key > 57) { // 숫자 0~9가 아닌값은 못들어감
				return false;
			}
		}

	</script>
	
	<jsp:include page = "../common/footer.jsp"/>
</body>
</html>