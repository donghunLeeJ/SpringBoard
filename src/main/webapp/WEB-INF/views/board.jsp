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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">내용</th>
							<th scope="col">작성자</th>
							<th scope="col">작성시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${arr }">
						<tr>
							<th scope="row">${i.seq }</th>
							<td>${i.title }</td>
							<td><a href="showContentsProc?seq=${i.seq }"> ${i.contents } </a></td>
							<td>${i.writer }</td>
							<td>${i.time }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="boardWrite" class="btn btn-info">글작성</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#boardWrite").on("click",function(){
			location.href="goBoardWrite";
		})
	</script>
</body>
</html>