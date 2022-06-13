<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>기부 게시판</title>
        
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
	    
	    
	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 
	
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
	    
	    <!-- Jquery -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        
    </head>
    <body>
	    <!-- Spinner Start -->
	    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
	            <span class="sr-only">Loading...</span>
	        </div>
	    </div>
	    <!-- Spinner End -->
	

	    
		<!-- Nav bar  -->
		<nav:navbar></nav:navbar>
	
	
	    <!-- Page Header Start -->
	    <div class="container-fluid page-header py-5 mb-5">
	        <div class="container py-5">
	            <h1 class="display-3 text-white mb-3 animated slideInDown">기부 게시판</h1>
	            <nav aria-label="breadcrumb animated slideInDown">
	            </nav>
	        </div>
	    </div>
	    <!-- Page Header End -->
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                
                    <!-- 게시글 내용-->
                    <article>
                        <!-- 타이틀-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${board.title }</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">${board.nickname }</div>
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                        </header>
                        <!-- 대표 이미지-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                        
                        <!-- 내용-->
                        <section class="mb-5">
                       		<p class="fs-5 mb-4">${board.content }</p>
                       		
                            <p class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                            <h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts every day</h2>
                            <p class="fs-5 mb-4">For me, the most fascinating interface is Twitter. I have odd cosmic thoughts every day and I realized I could hold them to myself or share them with people who might be interested.</p>
                            <p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I kind of want to know what happened there because we're twirling knobs here on Earth without knowing the consequences of it. Mars once had running water. It's bone dry today. Something bad happened there as well.</p>
                        </section>
                    </article>
                    
                    
                    <!-- 댓글 내용-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- 댓글 등록-->
                                <div class="d-flex mb-4">
                                	<div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                	<form class="ms-3" action="${appRoot }/donation/reply/add" method="POST">
                                		<input type="hidden" name="donationId" value="${board.donationId }" />
                                		<textarea class="form-control" rows="0" cols="80" name="content" placeholder="댓글만 써도 큰 힘이 됩니다. 같이 응원해요♥"></textarea>
                                		<button class="rounded">등록</button>
                                	</form>
                                </div>
                                <hr/>
                                <container id="replyList">
                                
                                </container>
                                <!-- 댓글 출력-->
                              <div class="d-flex mb-4">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                    <div class="mt-3">2022년 04월 14일</div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- 기부하기 공유하기 좋아요-->
                    <div class="card ml-10 mb-4 position-fixed" style="min-width : 20%;">
                        <div class="card-header"></div>
                        <div class="card-body">
                            <div class="row mb-4">
                                <div class="col-sm-6">
									<button type="button" class="btn btn-primary btn-lg" 
											data-bs-toggle="modal" data-bs-target="#modal1" >기부하러 가기</button>
                                </div>
                            </div>
                            <div class="row mb-4">
                            	<div class="col-sm-6">
                            		<button type="button" class="btn btn-outline-primary">공유하기</button>
                            	</div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-sm-6">
									<a class="text-dark heart" style="text-decoration-line: none;">
										<img id="heart" src="${appRoot }/resources/heart.png" />
										<p><span id="countHeart"></span> 개   좋아요</p>
										
									</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- foot bar -->
		<nav:footbar></nav:footbar>
		<!--ajax로 로그인에 따라 버튼누를 권한 처리하기!  -->
			<div class="modal fade" id="modal1" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">기부금 결제</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="form1" action="${appRoot }/member/remove" method="post">
								<input type="hidden" value="${member.id }" name="id" />
								<label for="" class="form-label">결제금액</label>
								<input class="form-control"  id="" type="text" name="" />
							    <div class="mb-3">
					            	<label for="message-text" class="col-form-label">응원 남기기</label>
					            	<textarea class="form-control" id="message-text"></textarea>
					          	</div>
							</form>
						</div>
						<div class="modal-footer">
							<button form="form1" type="submit" class="btn btn-danger">결제하기</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">나가기</button>
						</div>
					</div>
				</div>
			</div>
	    <!-- JavaScript Libraries -->
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
	    
	    <script>
    	$(document).ready(function(){
    		// 좋아요가 있는지 확인한 값을 heartVal에 저장
    		var heartVal = ${heart};
    		var count = ${count};
    		// heartVal이 1이면 좋아요가 이미 되있는것이므로 heart_full출력
    		if(heartVal > 0){
    	         console.log(heartVal);
    	         $("#heart").prop("src", "${appRoot }/resources/heart_full.png");
    		}else{
                console.log(heartVal);
                $("#heart").prop("src", "${appRoot }/resources/heart.png");
    		}
    		
    		// 좋아요 버튼을 클릭 시 실행되는 코드
    		$(".heart").click(function () {
			    $.ajax({
			    	url :'${appRoot}/favorite/click',
			        type :'POST',
			        data : {'donationId' : ${board.donationId}, 'memberId' : '${principal.name}'},
			    	success : function(data){
			    		
			    		var countHeart = data.count;
			    		var result = data.exit;
			    		
			    		$('#countHeart').text(countHeart);
			        	if(result == 1) {
			            	$('#heart').prop("src", "${appRoot }/resources/heart_full.png");
			        	} else {
		                	$('#heart').prop("src", "${appRoot }/resources/heart.png");
			        	}
		             }
			    });
	        });
    		
    		
    		/* 댓글목록 */
    		const replyList = function(){
    			const data = {donationId : ${board.donationId}};
    			
    			$.ajax({
    				
    				url :'${appRoot}/donation/reply/list',
    				type : 'POST',
    				data : data,
    				success : function(list){
    					const replyListElement = $('#replyList');
    	    			replyListElement.empty();
    	    			
    	    			$('#countHeart').text(count);
    	    			
    	    			for(let i = 0; i < list.length; i++){
    	    				const replyElement = $("<div class='d-flex mb-4' />");
    	    				replyElement.html(`
    	    					<div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                <div class="fw-bold">\${list[i].nickname } </div>
                                	\${list[i].content}
                                <div class="mt-3">\${list[i].inserted }</div>    
                                </div>
                                    `);
    	    				replyListElement.append(replyElement);
    	    			} // for문 끝
    				} // ajax 끝
    			}); // ajax 끝
    		}// ready 끝
    		
    		replyList(); // 댓글 목록 리스트 함수 실행!
    		
    		
    		
    	});
    	</script>
    </body>

</html>