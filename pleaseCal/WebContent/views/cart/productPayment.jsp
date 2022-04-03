<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.uni.cart.model.vo.Cart" %>
<%@ page import="com.uni.member.model.vo.Member" %>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	Cart cd = new Cart();
	//Member m = (Member)request.getAttribute("m");
	int totPrice = (int)(request.getAttribute("totPrice"));
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="././resources/css/styles2.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

	
.date {
  	text-align: right;
   }
   
   * {
    margin: 0;
    padding: 0;
	}

	table {
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	
	tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
	}

  .contents-cart {
      position: relative;
    visibility: hidden;
    width: 1000px;
    border: 1px solid #e0e0e0;
    margin: 0 auto 70px;
    padding: 40px 39px;
    background: #fff;
    }
    
    .cart-title {
        clear: both;
    height: 45px;
    margin-bottom: 0;
    padding-bottom: 32px;
    font-size: 30px
    }
    
    
    .cartTable{
    width: 898px;
    border-top: 0;
    }
    
    #cartTable-sku td.cart-deal-item__image {
    padding-right: 15px;
	}
	
	#cartTable-sku td.product-box {
    padding-left: 0;
	}

    colgroup{
    display: table-column-group;
    }
    
    table {
    border-collapse: collapse;
    border-spacing: 0;
    text-indent: initial;
	}
	
	
	body, input, textarea, select, button, table {
    font-family: sans-serif;
    font-size: 100%;
	}
	
	a, blockquote, body, button, dd, div, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, pre, select, span, td, textarea, th, ul {
    margin: 0;
    padding: 0;
    color: #111;
    font-family: Dotum,\\B3CB\C6C0,sans-serif;
	}
	
	.cartTable .head {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    background: lightyellow;
	}
	
	.cartTable th {
    height: 40px;
    font-size: 13px;
	}


	
	.product-name-part {
    border-bottom: 1px solid #e2e5e7;
    padding-bottom: 5px;
    letter-spacing: -1px;
	}

	.cart-deal-item td.product-box {
	    padding: 10px 5px 10px 15px;
	    text-align: left;
	    vertical-align: top;
	    z-index: 100;
	}
	
	.cartTable td {
    border-bottom: 1px solid #ddd;
    line-height: 35px;
    text-align: center;
	}
	
	.option-price-part {
    float: right;
    font-size: 12px;
    line-height: 24px;
	}
	
	.cart-deal-item td.product-box {
    padding: 10px 5px 10px 15px;
    text-align: left;
    vertical-align: top;
    z-index: 100;
	}

    .cart-deal-item td:nth-child(2) {
    width: 350px;
    overflow: hidden;
	}
	
	.cart-deal-item td:nth-child(3) {
    width: 60px;
    overflow: hidden;
	}
	
	.cart-deal-item td:nth-child(4) {
    width: 60px;
	}
	
	.cart-deal-item .unit-total-price {
    position: relative;
    line-height: normal;
    border-left: 1px solid #ddd;
    font-size: 12px;
    color: #888;
	}
	
	.cart-deal-item td {
    padding: 10px 0;
    z-index: 1;
	}
	
	.delivery-fee {
    border-left: 1px solid #ddd;
    font-size: 12px;
    color: #888;
	}
	
	.bundle-price-total td {
    position: relative;
    padding: 20px 35px 16px 0;
    background: lightyellow;
    font-size: 12px;
    line-height: 29px;
    text-align: right;
	}
	
	
	a, blockquote, body, button, dd, div, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, pre, select, span, td, textarea, th, ul {
    margin: 0;
    padding: 0;
    color: #111;
    font-family: Dotum,\\B3CB\C6C0,sans-serif;
	}
	
	.bundle-price-total .global-total-price-area, .bundle-price-total .rocket-fresh-total-price-area, .bundle-price-total .rocket-install-total-price-area, .bundle-price-total .rocket-total-price-area {
    display: inline-block;
	}
	
	.sr-only {
    position: absolute;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px,1px,1px,1px);
	}
	
	.bundle-price-total .number {
    display: inline-block;
    font: normal 15px/15px tahoma;
    color: #111;
    vertical-align: 0;
	}
	
	.symbol-minus, .symbol-plus {
    display: inline-block;
    width: 18px;
    height: 18px;
    margin: 0 8px;
    vertical-align: -5px;
	}
	
	.symbol-plus {
    background: url(//img1a.coupangcdn.com/image/order/mathematics-symbol.png) no-repeat;
    background-position: 0 0;
	}
	
	.symbol-equal, .symbol-plus1 {
    display: inline-block;
    width: 18px;
    height: 18px;
	}
	
	.symbol-equal {
    margin: 0 8px;
    background: url(//img1a.coupangcdn.com/image/order/mathematics-symbol.png) no-repeat;
    vertical-align: -5px;
    background-position: -36px 0;
	}
	
	.bundle-price-total .total-order-price.number {
    font-weight: 700;
	}
	
	.cart-total-price {
    clear: both;
    border: 4px solid #c8c8c8;
    text-align: center;
	}
	
	.cart-total-price__inner {
    display: inline-block;
    margin: 0 auto;
    vertical-align: top;
	}
	
	.cart-total-price .price-area {
    padding: 20px 15px 18px;
    font-size: 14px;
    line-height: 17px;
    color: #555;
    text-align: center;
	}
	 
	 .sr-only {
    position: absolute;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px,1px,1px,1px);
	}

	.symbol-plus1 {
    margin: 0 11px 0 10px;
    vertical-align: -4px;
    background: url(//img1a.coupangcdn.com/image/www/newBuy/img_plus_2.gif) no-repeat;
	}
	 
	.symbol-equal, .symbol-plus1 {
    display: inline-block;
    width: 18px;
    height: 18px;
	}

	.cart-total-price em {
	    padding: 0 4px 0 5px;
	    font: 700 17px/17px tahoma;
	    color: #111;
	}

	.symbol-equal1 {
	    background: url(//img1a.coupangcdn.com/image/www/newBuy/img_equals_2.gif) no-repeat;
	}
	
	.symbol-equal1, .symbol-minus1 {
	    display: inline-block;
	    width: 18px;
	    height: 18px;
	    margin: 0 11px 0 10px;
	    vertical-align: -4px;
	}

	.cart-total-price .final-order-price {
	    color: #ea0000;
	    font-size: 20px;
	}
	
	.faraway-notice {
    margin-top: 20px;
    padding: 12px 0 9px;
    background: #fafafa;
    font-size: 12px;
    color: #555;
    text-align: center;
    visibility: hidden;
	}
	
	.order-buttons, .summary-area {
    margin-top: 30px;
    text-align: center;
    position: relative;
	}
	
	.goPayment, .goShopping {
    font-size: 22px;
    font-weight: 1000;
    display: inline-block;
    position: relative;
    width: 200px;
    line-height: 18px;
    border: 2px solid lightgray;
    border-radius: 4px;
    padding: 22px 0 19px;
    text-align: center;
	}
	
	.goShopping {
    background: white;
    color: skyblue;
    margin-right: 5px;
	}
	
	.goPayment {
    background: skyblue;
    color: white;
    
	}
	
	.delete-option {
    position: relative;
    display: inline-block;
    width: 18px;
    height: 18px;
    margin-top: 3px;
    background: url(//img1a.coupangcdn.com/image/cart/generalCart/cart_sprite_170201.png) -114px 0 no-repeat;
    vertical-align: top;
    z-index: 120;
	}
	
	.option-price-part {
    float: right;
    font-size: 12px;
    line-height: 24px;
	}

	.unit-cost {
	    color: #888;
	    letter-spacing: 0;
	    vertical-align: top;
	}

	.customer__h2 {
    padding-left: 2px;
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    color: #333;
	}

	.customer__table {
    width: 100%;
    border-top: 2px solid #cecece;
	}

	.customer__col--2 {
	    border-bottom: 1px solid #e4e4e4;
	    padding: 10px 16px;
	}
	
	.customer__col--1 {
    width: 120px;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: 700;
    text-align: right;
    background: #f4f4f4;
	}

	.customer__col--2 {
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
	}

	.page-pc.page-order input[type=password], .page-pc.page-order input[type=tel], .page-pc.page-order input[type=text] {
	    height: 22px;
	    padding: 0 0 0 5px;
	    border: 1px solid #ddd;
	    font-size: 12px;
	    color: #333;
	}

	.customer__root {
    margin-top: 40px;
	}
	
	#product-list-amount{
	
		font-size: 15px;

		color: cadetblue;
	}

	.delivery-address__caption-header {
    padding-left: 2px;
    margin: 30px 0 8px;
    text-align: left;
    font-size: 20px;
    font-weight: 700;
	}
	
	.delivery-address {
    border-top: 2px solid #cecece;
    width: 100%;
	}
	
	.delivery-address__th {
    border-right: 1px solid #e4e4e4;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 10px 7px 15px;
    width: 120px;
    background-color: #f4f4f4;
    text-align: right;
	}
	
	.delivery-address__td--name {
    padding-top: 12.5px;
    padding-bottom: 12.5px;
	}
	
	.delivery-address__td {
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 0 10px 16px;
	}
	
	body, dd, div, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6, li, ol, pre, ul {
    margin: 0;
    padding: 0;
    font-size: 12px;
    color: #333;
    font-family: "돋움",Dotum,sans-serif;
	}
	
	.delivery-request-message__container {
    border-top: 1px solid #e4e4e4;
    border-left: 1px solid #f4f4f4;
    border-bottom: 1px solid #e4e4e4;
	}
	
	.delivery-request-message {
    width: 100%;
	}
	
	tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
	}

	.delivery-request-message__th {
    padding: 7px 10px 7px 15px;
    border-right: 1px solid #e4e4e4;
    width: 103px;
    background-color: #f4f4f4;
    text-align: right;
	}
	
	.delivery-request-message__td--name {
    padding-top: 10px;
    padding-bottom: 10px;
	}
	
	.delivery-request-message__td {
    padding: 10px 0 10px 16px;
    border-left: 1px solid #e4e4e4;
	}
	
	div[data-ajax-view=box] {
    position: relative;
	}

	.bundle-info__retail {
    margin-top: 8px;
	}
	
	.page-pc .bundle-info__pdd-group-title {
    margin-top: 20px;
	}
	
	.bundle-info__pdd-group-title {
    font-size: 18px;
    font-weight: 700;
    margin-bottom: 9px;
    margin-top: 20px;
    line-height: 21px;
	}
	
	.order-buttons, .summary-area {
    margin-top: 30px;
    text-align: center;
    position: relative;
	}



</style>
</head>
<body>
<jsp:include page = "../common/menu.jsp"/> 
<br><br><br><br><br>
<section id="contents-cart" class="contents-cart async-content" style="visibility: visible;">    <!-- 전체 섹션 -->    
        <section class="cart-title">
	        주문/결제
	        <hr>
        </section>
        
<%--구매자 정보 --%> <div data-component="customer"><div class="customer__root">
		    <h2 class="customer__h2">
		        구매자정보
		    </h2>
		    <table class="customer__table">
		        <tbody>
			        <tr>
			            <td class="customer__col customer__col--1">
			                이름
			            </td>
			            <td class="customer__col customer__col--2">
			                ${m.userName}
			            </td>
			        </tr>
		        	<tr data-component="customer-realname-auth"></tr>
		        	<tr>
		            <td class="customer__col customer__col--1">
		                휴대폰 번호
		            </td>
		            <td class="customer__col customer__col--2">
		                <div data-component="customer-phone"><div class="customer-phone__root">
		    <div data-component="customer-phone-form-tel">
			    <form data-customer-phone--form-tel="">
				    <div>
				        <input type="tel" class="customer-phone__input-tel " value="${m.phone}" id="buyerPhone" readOnly>
				        <button type="button" id="updatePhone">
				            수정
				        </button>
				    </div>
				</form>
			</div>
		    <div data-component="customer-phone-form-auth"></div>
			</div>
			</div>
		            </td>
		        </tr>
		    </tbody>
		</table>
		</div></div>
		        
<%--받는사람 정보 --%><div data-component="deliveryAddress">    <h2 class="delivery-address__caption-header">
        받는사람정보
        <button class="delivery-address__popup-list-button" type="button" id="ChangeDA">
            배송지변경
        </button>
    </h2>
    <table class="delivery-address">
        <tbody>
        <tr>
            <th class="delivery-address__th">이름</th>
            <td class="delivery-address__td delivery-address__td--name delivery-address__td-rocket-fresh-mvp2">
      
             <input type="text"  class="delivery-address__name" id="userName" value="${m.userName}" readOnly></input>
            </td>
        </tr>
        <tr>
            <th class="delivery-address__th">배송주소</th>
             <td class="delivery-address__td delivery-address__td--name delivery-address__td-rocket-fresh-mvp2">
           
                <input type="text"  class="delivery-address__name" id="userAddress" value="${m.address}" readOnly></input>
            </td>
        </tr>
        <tr>
            <th  class="delivery-address__th delivery-address__th--no-line">연락처</th>
          	 <td class="delivery-address__td delivery-address__td--name delivery-address__td-rocket-fresh-mvp2">
          
                <input type="text"  class="delivery-address__name" id="userPhone" value="${m.phone }" readOnly></input>
            </td>
        </tr>
        </tbody>
    </table>
</div>
        
<%--배송요청사항 --%> <div data-delivery-address__related-table="">
       					 <div data-component="deliveryRequestMessage"><div class="delivery-request-message__container" data-delivery-request-message__container="">
							<table class="delivery-request-message">
							    <tbody>
								    <tr>
								        <th class="delivery-request-message__th" style="width:120px">
								            <span>배송 요청사항</span>
								        </th>
									        <td class="delivery-request-message__td delivery-request-message__td--name">
									            <span class="delivery-request-message__type-label delivery-request-message__type-label--select" data-delivery-request-message__type-label="">
								               	
								    				<input id="dRequest" name="dRequest" type="text">
								    
								           		</span>
								        	</td>
								    </tr>
							    </tbody>
							</table>
						</div>
						</div>
        
    				</div>
    <br><br>
	<div id="list">
	<%--모든상품 삽입 --%>
	</div>
	
    <div class="bundle-info__pdd-group-title"><h3>결제 정보</h3></div>

	<div data-component="deliveryAddress">    
    	<table class="delivery-address">
	        <tbody>
		        <tr>
		            <th class="delivery-address__th">총 결제 금액</th>
		            <td class="delivery-address__td delivery-address__td--name delivery-address__td-rocket-fresh-mvp2">
		                <span class="delivery-address__name">${totPrice - 2500} 원</span>
		            </td>
		        </tr>
		        <tr>
		            <th class="delivery-address__th">할인쿠폰</th>
		            <td class="delivery-address__td">적용 가능한 할인쿠폰이 없습니다.</td>
		        </tr>
		        <tr>
		            <th class="delivery-address__th delivery-address__th--no-line">배송비</th>
		            <td class="delivery-address__td delivery-address__td--no-line">2500 원</td>
		        </tr>
		          <tr>
		            <th class="delivery-address__th delivery-address__th--no-line">총 결제 금액</th>
		            <td class="delivery-address__td delivery-address__td--no-line">${totPrice} 원</td>
		        </tr>
		        <tr>
		            <th class="delivery-address__th delivery-address__th--no-line">결제 방법</th>
		            <td class="delivery-address__td delivery-address__td--no-line"><input type="radio" checked>&nbsp 카카오 페이</td>
		        </tr>
	        </tbody>
    	</table>
	</div>
	

    <div class="order-buttons">
	 
		<a id="continueShoopingBtn" class="goShopping logging" href="<%=request.getContextPath()%>/cartList.do">이전 단계로</a>
		<a id="check_module" type="button" class="goPayment">결제하기</a>

	</div>
	<iframe id="ab_iframe" class="ab_test"width="0" height="0"></iframe> 
	</section>
	<jsp:include page = "../common/footer.jsp"/>
	
	<script>
   		$(function(){
   			
   			$.ajax({
   		   		url: "orderProductList.do",
   		   		
   		   		type: "post",
   		   		
   		   		success:function(list){
   		   	
   		   			let value = "";
   		   			console.log(list)
   		   			for(var i  in list){
			 
   								value +=  
   									'<table class="cartTable">'+
   						   		   
   							     '<caption class="none"></caption>'+ <!-- 여백 생성  -->
   							     '<colgroup><col width="50"><col width="100"><col width="30"><col width="30"></colgroup>'+ <!-- 상품정보 자리 잡아주기 -->
   							     
   							     '<thead>'+
   							           '<tr class="head">'+
   							               
   							       	   '<th scope="colgroup" id="th-product-box" colspan="2" style="text-align:center">상품정보</th>'+
						               '<th scope="col" id="th-unit-total-price" style="text-align:center">상품금액</th>'+
						               '<th scope="col" id="th-delivery-fee" style="text-align:center">배송비</th>'+
   							               
   							           '</tr>'+
   							     '</thead>'+
   						           
   						   		'<tbody id="cartTable-sku">'+
   						   
   						           '<tr class="cart-deal-item">'+
   						               
   						           		'<td class="cart-deal-item__image" id="pImg">'+
   						                       
   						                   '<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+'" width=78px height=78px alt="상품이미지" /></a>'+
   						                     
   						                '</td>'+
   						                   '<td class="product-box">'+
   						                       
   						                       '<div class="product-name-part">'+
   						                           
   						                           '<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'" class="product-name moveProduct modify-color" style=" text-decoration: none; color: inherit"><b>'+list[i].pName+'</b></a>'+
   						                           
   						                       '</div>'+
   						                       
   						                       '<div id="80200404752" data-dawn-only="false" class="option-item modify-float" data-quantity="1" >'+
   						                       
   						                           '<div class="option-item-info" data-restock-notification-state="false">'+
   						                            
   						                                '<div class="delivery-date rocket modify-padding">'+
   						                                
   						                                     '<span class="arrive-date" style="display: inline-block; font-size:14px;"><strong>'+list[i].dDate+' <br>도착 예정</strong></span>'+
   						                                  	 
   						                                '</div>'+

   						                           '</div>'+
   						                           
   						                                '<div class="option-price-part" >'+

   															'<div id="product-list-amount"><b>'+list[i].pAmount+' 개</b></div>'+

   						                                '</div>'+
   						                         
   						                         '</div>'+
   						                          
   						                   '</td>'+
   						                   
   						                   '<td class="unit-total-price">'+
   							                    
   											   '<div class="unit-total-sale-price" name="twochangePrice'+i+'">'+list[i].pPrice+'</div>'+
   									
   										   '</td>'+
   						                   
   							               '<td class="delivery-fee" rowspan="1" headers="th-delivery-fee">'+
   						                           
   							            '<span class="delivery-fee__free"  name="dPrice'+i+'">'+ dPrice(i) +'원</span>'+
				                           
						                   '</td>'+
						                      
						           '</tr>'+
							        
						       	   '<tr class="special-gift-area" style="display: none;"></tr>'+
						       	   
						       	   '<tr class="bundle-price-total">'+
						       	   
						           	  '<td colspan="5">'+
						               
						                 '<span class="rocket-total-price-area">상품가격'+
						                 
											 '<span class="total-product-price number"  name="ChangePrice'+i+'" >'+list[i].pPrice+'</span>원 <span class="coupon-area">'+
						                   
							                     '<span class="symbol symbol-plus"><span class="sr-only">더하기</span></span>'+
							                     
												 '배송비 <span id="rocket-delivery-charge" class="delivery-charge" name="dPrice'+i+'"><strong>'+ dPrice(i) +'원</strong></span>'+
												 
												 '<span class="symbol symbol-equal"><span class="sr-only">결과는</span></span>'+
												 
												 '주문금액 <span class="total-order-price number"  name="changetotal'+i+'">'+(list[i].pPrice + dPrice(i))+'</span>원'+
   						                 
   										     '</span>'+
   						           		  '</span>'+
   						           	   '</td>'+
   						      	    '</tr>'+
   						   
   						   		'</tbody>'+

   						     '</table>'+
   							                  
   						   	 '<form id="listInfo'+i+'" action="<%=request.getContextPath()%>/pay">'+
   						 	 '<input type="hidden" id="title'+i+'" name="title'+i+'" value="'+list[i].pId+'">'+	
						       	 '<input type="hidden" id="price'+i+'" value="'+list[i].poPrice+'">'+	
						       	 '<input type="hidden" id="total" name="total'+i+'" value="">'+	
						       	 
   						     
   						      	 '<input type="hidden" id="dDate" value="'+list[0].dDate+'">'+	
   						     	 '<input type="hidden" id="lZero" value="'+list[0].pName+'">'+	
   						   		'<input type="hidden" id="lSize" value="'+list.length+'">'+	
   						     '</form>' <%-- 본문 끝--%>
						     
							function dPrice(i){
  			   		   			let c = 0;
  			   		   			if(i == 0){
  			   		   					c = 2500;
  			   		   				}else{
  			   		   					c = 0;
  			   		   				}
  			   		   				
  			   		   			return c	
   			   		   		}
   							
   		   			} <%-- for문 끝--%>
   		   		
   		    	$('[name="total"]').val(${totPrice})
   		    	console.log($('[name="total"]').val())
   		   		$('#list').html(value);
   		   		//console.log(list)
				
   	   		},
		   	   	error:function(request, error){
		   	   		
		   	   		//alert("fail");
		   	   		alert("code:" + request.status + "\n" + "message:" + request.reponseText + "\n" + "error:" + error);
		   	   		
			   		//console.log("ajax통신실패");
			   		//console.log(list)
	   		
			}
   		})
   	})
   	
   
   </script>
	
	<script>
		
		// 배송지 변경 이벤트
		$("#ChangeDA").click(function() {

			//부모 팝업 이름
			window.name = "parent";
			// 팝업 url
			let url = "views/order/changeDA.jsp";
			// 팝업 이름
			let name = "changeDAPopup";
			// 팝업 속성
			let option = "width = 800, height = 300, top = 50%, left = 50%, location = no";
			
			window.open(url, name, option);
						
		})
	
	</script>
	
	<script>
		
		// 전화번호 업데이트하는 이벤트
		$("#updatePhone").click(function() {
			window.name = "parent";
			// 팝업 url
			let url = "<%=request.getContextPath()%>/updatePhoneForm.do";
			// 팝업 이름
			let name = "updatePhonePopup";
			// 팝업 속성
			let option = "width = 600, height = 200, top = 50%, left = 50%, location = no";
			
			open(url, name, option);
						
		})
	
	</script>
	
	
	
	
	<script>
	
		$("#check_module").click(function () {
			
			var IMP = window.IMP; 
			
			IMP.init('imp70634783');
				//가맹점식별코드
				
			IMP.request_pay({
				
					pg: 'kakao', 
					// 결제에 사용할 브랜드명
					pay_method: 'card',
					
					merchant_uid: new Date().getTime(),
					// 결제 실행 시간
					name: '주문명: ' + $('#lZero').val() + '외 ' + ($('#lSize').val()-1) + '개',
					//결제창에서 보여질 이름
					
					amount: '<%=totPrice%>'
					//가격
					
					
			}, function(rsp){
				
				let dDate = $('#dDate').val();
				
				let dRequest = $('[name=dRequest]').val();
				let re = rsp.success;
				console.log(dDate)
				console.log(re)				
				let data = {
					dDate:dDate,
					re:re
				};
				console.log(re)

				location.href="<%=request.getContextPath()%>/paymentResult.do?re="+re+"&dRequest="+dRequest;

					});<%--- 함수 종료지점 --%>
							
			}); <%---클릭--%>
	</script>

</body>
</html>