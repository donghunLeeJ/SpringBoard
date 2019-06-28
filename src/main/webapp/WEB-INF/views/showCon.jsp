<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								class="form-control"></th>
						</tr>
					</thead>
					<tbody>
						<tr style="overflow: hidden;">
							<th scope="col">작성자</th>
							<th scope="col"><input type="text" value="${dto.writer }"
								class="form-control">
						</tr>
						<tr style="overflow: hidden;">
							<th scope="col">작성시간</th>
							<th scope="col"><input type="text" value="${dto.time }"
								class="form-control">
						</tr>
						<tr style="overflow: hidden;">
							<th scope="col">내용</th>
							<th scope="col"><textarea 
									style="height: 100%; width: 100%;" class="form-control">${dto.contents }</textarea></th>
						</tr>
						<tr style="overflow: hidden;">
							<th scope="col">첨부파일</th>
							<th scope="col"><a href="${dto.filePath }">${dto.filePath }</a></th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>