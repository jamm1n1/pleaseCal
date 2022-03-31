<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<br><br><br><br><br><br><br>
	<div>
		<p> ${msg}</p>
	</div>

  	<div class="order-buttons">p
	 
		<a id="continueShoopingBtn" class="goShopping logging" href="<%=request.getContextPath()%>">쇼핑 계속 하기</a>
		<a id="continueShoopingBtn" class="goShopping logging" href="<%=request.getContextPath()%>/myOrderList.do">주문내역으로 이동</a>

	</div>
 <jsp:include page = "../common/footer.jsp"/>
</body>
</html>