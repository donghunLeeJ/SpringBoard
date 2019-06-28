<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
		<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
		<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
		<li class="nav-item"><a class="nav-link disabled" href="#"
			tabindex="-1" aria-disabled="true">Disabled</a></li>
	</ul>
	<div class="container">
		<div class="row">
			<div class="col">

				<table class="table">
					<thead class="thead-dark">
						<tr class="row">
							<th scope="col" class="col-lg-2">상품번호</th>
							<th scope="col" class="col-lg-3">사진</th>
							<th scope="col" class="col-lg-4">소개</th>
							<th scope="col" class="col-lg-3">판매자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${arr }">
							<tr class="row">
								<th scope="col" class="col-lg-2">${i.seq }</th>
								<th scope="col" class="col-lg-3"><a href="shopView?seq=${i.seq }"><img style="width: 100px"
									src="${i.filePath }"></a></th>
								<th scope="col" class="col-lg-4">${i.contents }</th>
								<th scope="col" class="col-lg-3">${i.writer }</th>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
				<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${paging.needPrev == true}">
					<li class="page-item"><a class="page-link" href="shop?page=${paging.toPrev }">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${paging.startNavi }"
						end="${paging.endNavi }">
						<li class="page-item"><a class="page-link" href="shop?page=${i }">${i }</a></li>
					</c:forEach>
					<c:if test="${paging.needNext == true}">
					<li class="page-item"><a class="page-link" href="shop?page=${paging.toNext }">Next</a></li>
					</c:if>
				</ul>
				</nav>



				<button id="registerProduct" class="btn btn-info">상품 등록</button>


			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#registerProduct").on("click", function() {
			location.href = "register";
		})
	</script>
</body>
</html>