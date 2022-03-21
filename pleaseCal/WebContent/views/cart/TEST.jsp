<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
   
   		$(function(){
   			
   			$.ajax({
   		   		url: "cartList.do",
   		   		
   		   		type: "get",
   		   		
   		   		success:function(list){
   		   	
   		   			let value = "";
   		   			
   		   			for(var i in list){
			 
   		   value += '<table class="cartTable">'+
   		            '<caption class="none"></caption>'+ <!-- 여백 생성  -->
   		            '<colgroup><col width="50"><col width="100"><col width="30"><col width="30"></colgroup>'+ <!-- 상품정보 자리 잡아주기 -->
   		        	'<thead>'+
	   		            '<tr class="head">'+
	   		                
	   		                '<th scope="colgroup" id="th-product-box" colspan="2">상품정보</th>'+
	   		                '<th scope="col" id="th-unit-total-price">상품금액</th>'+
	   		                '<th scope="col" id="th-delivery-fee">배송비</th>'+
	   		                
	   		            '</tr>'+
	   		        '</thead>'+
	   		            
	   		    	'<tbody id="cartTable-sku">'+
	   		    
	   		            '<tr class="cart-deal-item ">'+
	   		                
	   		                   
	   			                '<td class="cart-deal-item__image" id="pImg">'+
	   		                        
	   		                             '<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"><img class="card-img-top" src="<%=request.getContextPath() %>/resources/image/'+list[i].piName+' width="78" height="78" " alt="상품이미지" /></a>'+
	   		                        
	   		                    '</td>'+
	   		                    '<td class="product-box">'+
	   		                 
	   		                        '<div class="product-name-part">'+
	   		                            
	   		                         '<a href="<%=request.getContextPath() %>/detailProduct.do?no='+list[i].pId+'"></a>'+
	   		                                 
	   		                        '</div>'+
	   		                        
	   		                            '<div id="80200404752" data-dawn-only="false" class="option-item modify-float" data-quantity="1" data-vendor-id="A00010028" data-vi="80200404752" data-vip="" data-pid="6236874079" data-itemid="12565414376" data-bundle-id="18170189112">'+

	   		                                '<div class="option-item-info" data-restock-notification-state="false">'+
	   		                             
	   		                                            '<div class="delivery-date rocket modify-padding">'+
	   		                                                '<span class="arrive-date" style="display: inline-block; font-size:14px"><strong>'+list[i].getdDate()+'</strong></span>'+
	
	   		                                            '</div>'+
	
	   		                                '</div>'+
	   		                                '<div class="option-price-part">
	   		                                    
	   			
	   				'<span class="unit-cost" ><span class="sr-only">제품가격</span>'+list[i].getpPrice()+'</span>'+
	   				'<span class="select-select">'+
	   				
	   				'<select class="quantity-select" id="amountChange">'+
	   						
	   							
	   								'<option value="1" selected="selected">1</option>
	   							
	   								'<option value="2">2</option>'+
	   							
	   								'<option value="3">3</option>'+
	   							
	   								'<option value="4">4</option>'+
	   							
	   								'<option value="5">5</option>'+
	   							
	   								'<option value="6">6</option>'+
	   							
	   								'<option value="7">7</option>'+
	   							
	   								'<option value="8">8</option>'+
	   							
	   								'<option value="9">9</option>'+
	   							
	   								'<option value="10">10+</option>'+
	   						
	   					'</select>'+
	   				'</span>'+
	   				'<span class="select-text">'+
	   			
	   				'</span>'+
	   				'<span class="unit-price-area"><span class="unit-price"><span class="sr-only">구매가격</span>'+list[i].getpPrice()+'</span></span>'+
	
	
	   		                                    '<a href="<%=request.getContextPath()%>/deleteItems?pId='+list[i].pId+'" itemStatus=CHECKED data-url="/memberCartItem/deleteItems?cartItemIds[]=18170189112&amp;itemStatus=CHECKED" data-all="false" class="delete-option"><span class="sr-only">'+list[i].getpName()+'상품삭제</span></a>'+
	   		                                    
	   		                                        
	   		                                    
	   		                                </div>
	   		                            </div>
	   		                           
	   		                    </td>
	   		                    
	   		                    <td class="unit-total-price">
	   			                    
	   					
	   						<div class="unit-total-sale-price">32,740원</div>
	   					
	
	   		                    </td>
	   		                    
	   			                    <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
	   		                            
	   		                                <span class="delivery-fee__free">2,500원</span>
	   		                            
	   		                        </td>
	   		                    
	   		                
	   		            </tr>
	   			        
	   		        
	   		        <tr class="special-gift-area" style="display: none;">
	   		            
	   		        </tr>
	   		        <tr class="bundle-price-total">
	   		            <td colspan="5">
	   		                
	   		                <span class="rocket-total-price-area">
	   							상품가격 <span class="total-product-price number">0</span>원 <span class="coupon-area">
	   		                    
	   		                    <span class="symbol symbol-plus"><span class="sr-only">더하기</span></span>
	   							배송비 <span id="rocket-delivery-charge" class="delivery-charge"><strong>2,500원</strong></span>
	   							<span class="symbol symbol-equal"><span class="sr-only">결과는</span></span>
	   							주문금액
	   		                  
	   		                    <span class="total-order-price number">0</span>원
	   		                  
	   						</span>
	   		            </span></td>
	   		        </tr>
	   		    
	   		    </tbody>
	
	   		            
	   		        </table>
			                  
						}
						$("#list").html(value);
	   		   		},
	   		   		
	   		   		error:function(){
	   		   			console.log("ajax통신실패");
   		   		}
   	   		})
   		})
   		
   </script>
</body>
</html>