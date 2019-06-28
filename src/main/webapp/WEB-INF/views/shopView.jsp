<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col"><input type="text" value="${dto.title }"
								class="form-control" readOnly></th>
						</tr>
					</thead>
					<tbody>
						<tr style="overflow: hidden;">
							<th scope="col">사진</th>
							<th scope="col"><img style="width: 150px" alt=""
								src="${dto.filePath }"></th>
						</tr>
						<tr style="overflow: hidden;">
							<th scope="col">작성자</th>
							<th scope="col"><input type="text" value="${dto.writer }"
								class="form-control" readOnly>
						</tr>

						<tr style="overflow: hidden;">
							<th scope="col">내용</th>
							<th scope="col"><textarea style="height: 100%; width: 100%;"
									class="form-control" readOnly>${dto.contents }</textarea></th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<form action="inputReply"  method="post">
		<div class="row border-top ">
			
			<div class="col-lg-10">
				<input type="hidden" name="writer" value="${dto.writer }">
				<input type="hidden" name="shop_seq" value="${dto.seq }">
				<input type="text" class="form-control" placeholder="Username"
					name="contents">
			</div>
			<div class="col-lg-2">
				<button type="submit" id="replyBTN" class="btn btn-info">댓글달기</button>
			</div>
			
			<c:forEach var="i" items="${Rarr }">
			<div class="col-lg-8 my-1">
				<input type="text" class="form-control" value="${i.contents }">
			</div>
			<div class="col-lg-2 my-1">
				<input type="text" class="form-control" value="${i.writer }">
			</div>
			<div class="col=lg-2 my-1">
				<input type="button" class="btn btn-info" value="댓글삭제">
			</div>
			</c:forEach>
		</div>
		</form>	
		<script type="text/javascript">
			
			
		
		
		
		</script>






	</div>

</body>
</html>