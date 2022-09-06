<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>

<head>
<title>Giỏ hàng</title>
</head>
<body>
<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="<c:url value="/trang-chu"/>">Trang chủ</a> <span class="divider">/</span></li>
		<li class="active">Giỏ hàng</li>
    </ul>
	<div class="well well-small">
		<h1>Giỏ hàng <small class="pull-right"> ${ TotalQuantyCar } Sản phẩm trong giỏ hàng </small></h1>
	<hr class="soften"/>	

	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Hình ảnh</th>
                  <th>Mô tả</th>
                  <th>Màu sắc</th>
                  <th>Giá bán</th>
                  <th>Số lượng </th>
                  <th>Chỉnh sửa </th>
                  <th>Xóa </th>
                  <th>Tổng tiền</th>
				</tr>
              </thead>
              <tbody>
              
				<c:forEach var="item" items="${ Cart }">
					<tr>
	                  <td><img width="100" src="<c:url value="/assets/user/img/${ item.value.product.img }"/>" alt=""></td>
	                  <td>${ item.value.product.title }</td>
	                  <td><span class="shopBtn" style="background-color: ${ item.value.product.code_color };"><span class="icon-ok"></span></span> </td>
	                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.value.totalPrice }"/> ₫</td>
	                  <td>
						<input type="number" min="0" max="1000" class="span1" style="max-width:34px" placeholder="1" id="quanty-cart-${ item.key }" size="16" type="text" value="${ item.value.quanty }">
					  </td>
	                  <td>
	                  	<button data-id="${ item.key }" class="btn btn-mini btn-danger edit-cart" type="button">
	                  		<span class="icon-edit"></span>
	                  	</button>
	                  </td>
	                  <td>
	                  	<a href="<c:url value="/DeleteCart/${ item.key }"/>" class="btn btn-mini btn-danger" type="button">
	                  		<span class="icon-remove"></span>
	                  	</a>
	                  </td>
	                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCar }"/> ₫</td>
	                </tr>
				</c:forEach>
                
				</tbody>
            </table><br/>
			
	<a href="<c:url value = "/trang-chu" />" class="shopBtn btn-large"><span class="icon-reply"></span> Tiếp tục mua sắm </a>
	<a href="<c:url value="/checkout"/>" class="shopBtn btn-large pull-right">Thanh toán <span class="icon-share-alt"></span></a>

</div>
</div>
</div>
<content tag="script">
<script>
	$(".edit-cart").on("click", function(){
		var id = $(this).data("id");
		var quanty = $("#quanty-cart-" +id).val();
		window.location = "EditCart/"+id+"/"+quanty;
	});
</script>

</content>

</body>
