<%@page import="com.team.honeybee.domain.MarketDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/resources/admin" var="resources" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${resources }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="${resources }/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		$("#edit-button").click(function() {
			$("#input1").removeAttr("readonly");
			$("#textarea1").removeAttr("readonly");
			$("#input2").removeAttr("readonly");
			$("#input3").removeAttr("readonly");
			$("#modify-button").removeClass("d-none");
			$("#delete-button").removeClass("d-none");
			$(".removeFileCheckbox").removeClass("d-none");
		});
		$("#delete-button").click(function(e) {
			e.preventDefault();
			
			if(confirm("삭제하시겠습니까?")) {
				let form1 = $("#form1");
				let actionAttr = "${appRoot}/admin/deleteMarket.do";
				form1.attr("action", actionAttr);
				
				form1.submit();
			}
		});
	});
</script>

<title>기부마켓 내용(관리자)</title>
</head>
<body>

	<div id="wrapper">

		<nav:sidebar current="board"></nav:sidebar>
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <nav:topbar></nav:topbar>
				<div class="container-fluid">
					
					<div class="container">
						<div class="row">
							<div class="col">
								<button id="edit-button" class="btn btn-secondary">
									<i class="fa-solid fa-pen-to-square"></i>
								</button>
								<form id="form1" action="${appRoot }/admin/updateMarket.do" method="post" enctype="multipart/form-data">
									<input type="hidden" name="marketId" value="${market.marketId }" />
									<c:forEach items="${market.fileName }" var="file">
										<%
										String file = (String) pageContext.getAttribute("file");
										String encodedFileName = java.net.URLEncoder.encode(file, "utf-8");
										pageContext.setAttribute("encodedFileName", encodedFileName);
										%>
										<div class="row">
											<div class="col-lg-1 col-12 d-flex align-items-center">
												<div class="d-none removeFileCheckbox">
													<div class="form-check form-switch">
														<label class="form-check-label text-danger">
															<input class="form-check-input delete-checkbox" type="checkbox" name="removeFileList" value="${file }"/>
															<i class="fa-solid fa-trash-can"></i>
														</label>
													</div>
												</div>
											</div>
											<div>
												<img src="${imageUrl }/market/${market.marketId }/${encodedFileName }" alt="" />
											</div>
										</div>
									</c:forEach>
									<div>
										<label class="form-label" for="input1">제목</label>
										<input class="form-control mb-3" type="text" name="title" required id="input1" value="${market.title }" readonly />
									</div>
									
									<div>
										<label class="form-label" for="textarea1">본문</label>
										<textarea class="form-control mb-3" name="content" id="textarea1" cols="30" rows="10" readonly>${market.content }</textarea>
									</div>
									<div>
										<label class="form-label" for="input2">상품명</label>
										<input class="form-control mb-3" type="text" name="productName" required id="input2" value="${market.productName }" readonly />
									</div>
									<div>
										<label for="fileInput1" class="form-label">
										파일 추가
										</label>
										<input class="form-control mb-3" multiple="multiple" type="file" name="addFileList" accept="image/*"/>
									</div>
									<div>
										<label for="input3" class="form-label">가격</label>
										<input class="form-control mb-3" name="price" type="number" id="input3" value="${market.price }" readonly />
									</div>
									
									<button id="modify-button" class="btn btn-primary d-none">수정</button>
									<button id="delete-button" class="btn btn-danger d-none">삭제</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${appRoot }/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${appRoot }/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${appRoot }/resources/admin/js/sb-admin-2.min.js"></script>
</body>
</html>