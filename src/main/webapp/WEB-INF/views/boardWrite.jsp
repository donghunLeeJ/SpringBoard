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
				<form action="BoardWriteProc" method="post" enctype="multipart/form-data">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col"><input type="text" name="title"
								class="form-control">
							<input type="hidden" name="writer" value="${mem.lastName }"></th>
						</tr>
					</thead>
					<tbody>
						<tr style="overflow: hidden;">
							<th scope="col">내용</th>
							<th scope="col"><textarea
									name="contents" style="height: 100%; width: 100%;" class="form-control"></textarea></th>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th scope="col">파일 첨부</th>
							<th scope="col">
								<div class="custom-file">
									<input name="boardFile" type="file" class="custom-file-input" id="customFile">
									<label class="custom-file-label" for="customFile">Choose
										file</label>
								</div>
							</th>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="btn btn-info">제출</button>
			</form>
			</div>
		</div>
	</div>

</body>
</html>