<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Post - Start Bootstrap Template</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

<!-- google font 추가함 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${appRoot }/resources/webContents/lib/animate/animate.min.css" rel="stylesheet">
<link href="${appRoot }/resources/webContents/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="${appRoot }/resources/webContents/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${appRoot }/resources/webContents/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${appRoot }/resources/webContents/css/style.css" rel="stylesheet">


<!-- daum 주소검색 api 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 input에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 입력 포커스
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
</script>
</head>
<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->



	<!-- Nav bar  -->
	<nav:navbar></nav:navbar>


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">기부 모임</h1>
			<nav aria-label="breadcrumb animated slideInDown"></nav>
		</div>
	</div>
	<!-- Page Header End -->

	<!-- Nav bar -->
	<nav:navbar></nav:navbar>
	<!-- 모임 데이터 처리용(나중에 제안서로 변경예정) -->
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>모임 작성</h1>
				<form action="${appRoot }/meeting/board" method="post"
					enctype="multipart/form-data">
					<!-- meeting_id : 자동생성
					member_id : 권한처리 -->

					<!-- 모임 카테고리 고르기 추가해야함 -->

					<label for="titleInput" class="form-label">제목</label>
					<input type="text" name="title" id="titleInput" /> 
					
					<br>

					<select name="" id="form-select">
						<option selected="selected">모임 주제를 선택해 주세요</option>
						<option value="1">전체</option>
						<option value="2">어린이</option>
						<option value="3">장애인</option>
						<option value="4">어려운 이웃</option>
						<option value="5">환경</option>
					</select>  
					
					<br>

					<label for="contentsTextarea" class="form-label">본문</label>
					<textarea name="contents" id="contentsTextarea" cols="30" rows="10"
						class="form-control"></textarea>
					
					<br>

					<label for="address">모임장소</label>
					<input type="text" name="postcode" id="postcode" placeholder="우편번호">
					<input type="button" onclick="daumPostCode()" value="우편번호 찾기">
					<input type="text" id="address" name="address" placeholder="주소">
					<input type="text" id="detailAddress" name="detailAddress"
						placeholder="상세주소">
						
					<br>

					모임사진
					<input multiple="multiple" type="file" name="file" accept="image/*"/>
					
					<br>

					<!-- guest : 모임보드에서 넘겨줄 값 -->

					<!-- inserted : 자동생성 -->
					start_date :
					<label for="start_date">모집 시작일</label>
					<input type="date" name="start_date" id="start_date" />

					end_date :
					<label for="end_date">모집 종료일</label>
					<input type="date" name="end_date" id="end_date" />

					<button type="submit">전송</button>

				</form>
			</div>
		</div>
	</div>
	<!-- foot bar -->
	<nav:footbar></nav:footbar>


	<!-- JavaScript Libraries -->
	<!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/wow/wow.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/easing/easing.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/waypoints/waypoints.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/counterup/counterup.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="${appRoot }/resources/webContents/lib/lightbox/js/lightbox.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="${appRoot }/resources/webContents/js/main.js"></script>
	
 </body>
</html>