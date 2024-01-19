<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
.example-div {
	width: 100%;
	margin: 0 auto;
	padding: 20px;
	color: black;
	font-weight: bold;
}
.text-details{
margin: 0px 0 30px;
text-align: center;
}

.text-container {
	width: 80%;
	margin: 0 auto;
	padding: 0px;
}



#remainingTime {
	background-color:#2A2A2A;
	font-size: 25px;
	border-radius: 10px;
	padding: 2px;
	width: 420px;
	text-align: center;
	margin: 20px 0 30px;
	color: white;
	font-weight: bold;
}
</style>
<script>
        // Ajax 호출하여 남은 시간 업데이트
        function updateRemainingTime(regdate) {
            var currentTime = new Date().getTime();
            var expirationTime = new Date(regdate).getTime() + (7 * 24 * 60 * 60 * 1000);

            var remainingTime = expirationTime - currentTime;

            if (remainingTime <= 0) {
                $("#remainingTime").text("시간이 만료된 상품입니다.");
                return;
            }

            var days = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
            var hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

            $("#remainingTime").text(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초");
        }

        // 페이지 로드 후 초기 업데이트
        $(document).ready(function() {
            updateRemainingTime("${board.regdate}");
        });

        // 일정 간격으로 업데이트
        setInterval(function() {
            updateRemainingTime("${board.regdate}");
        }, 1000); // 1초마다 업데이트
    </script>
</head>
<body>

	<div class="container">
		<div class="product" style="display: flex;">
			<div class="images">
			
				<img
					src="${pageContext.request.contextPath}/image/board/${board.file1}"
					width="420px" height="680px" alt="Product Image">
			</div>
			<div class="text-details" style="margin-left: 150px;">
				<div id="remainingTime"></div>
				<span style="color: black; font-weight: bold; font-size: 50px;">${board.pname}</span>
				<div><span style="color: black; font-weight: bold; font-size: 20px;">즉시구매가:</span>
					<span style="color: black; font-weight: bold; font-size: 30px;">${board.price}&nbsp;원</span><br>
					<span style="color: black; font-weight: bold; font-size: 20px;">시작경매가:</span>
					<span style="color: black; font-weight: bold; font-size: 30px;">${board.price}&nbsp;원</span><br>
					<span style="color: black; font-weight: bold; font-size: 20px;">현재입찰가:</span>
					<span style="color: red; font-weight: bold; font-size: 30px;">${board.price}&nbsp;원</span><br>
				</div><p>
				<form class="cart" method="post" enctype='multipart/form-data'>
				<a
                        href="${pageContext.request.contextPath}/jumun/jumunAdd?pnum=${board.pnum}">찜하기</a>
					<button type="submit" class="">찜하기</button>
					<button onclick="openPurchasePopup()">입찰하기</button>
					<button onclick="">즉시구매</button>
				</form>
			</div>
		</div>

		<div class="example-div">
			<div class="">
				<div class="">
					<table>
						<colgroup>
							<col width="150px">
							<col width="340px">
							<col width="150px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>작성자</th>
								<td>${amem.id }님</td>
							</tr>
							<tr>
								<th>경매등록일시</th>
								<td><fmt:formatDate value="${board.regdate}"
										pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /></td>
							</tr>
							<tr>
								<th>제품상세</th>
								<td>${board.subject}</td>
							</tr>
							<tr>
								<th>상세내용</th>
								<td>${board.content}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 댓글영역 start -->
		<div class="row">
			<div class="col-sm-1">답변글</div>
			<input type="text" class="form-control" id="id"
				placeholder="${amem.id }" value="${amem.id }" name="userid">
			<div class="col-sm-10">
				<input type="text" class="form-control " id="comment"
					onkeyup="enterkey('${board.pnum}')">
			</div>
			<div class="col-sm-1">
				<button class="btn btn-primary "
					onclick="commentPro('${board.pnum}')">저장</button>
			</div>
		</div>
		<div class="row" id="commentList">
			<c:set var="sercount" value="${count}" />
			<c:forEach var="c" items="${commentLi}">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-10">${sercount} 작성자${c.userid}님 작성시간${c.regdate} ${c.content}</div>
						<div class="col-sm-2">
							<form
								action="${pageContext.request.contextPath}/board/commentDeleteForm"
								method="post">
								<input type="hidden" name="ser" value="${c.ser}">
								<button type="submit">삭제</button>
							</form>
						</div>
					</div>
				</div>
				<c:set var="sercount" value="${sercount - 1}" />
			</c:forEach>
		</div>
		<script>
let count = ${count}
function enterkey(pnum, userid) {
   if(window.event.keyCode==13) {
      commentPro(pnum, userid)
   }
}
function commentPro(pnum, userid) {
   count = count+1
   let comment = document.querySelector("#comment").value
   //alert(comment)
   const xhttp = new XMLHttpRequest()
   let url = "${pageContext.request.contextPath}/board/boardCommentPro?comment="
         +comment+"&boardnum="+pnum+"&count="+count+"&userid="+userid
   xhttp.open("GET",url,true)
   xhttp.send()
   xhttp.onreadystatechange = function() {      
      if(this.readyState ==4 && this.status==200) {
     
      
   let commentList = document.querySelector("#commentList")
   commentList.innerHTML = this.responseText + "<br>" + commentList.innerHTML
   location.reload(true);
      }      
}
   document.querySelector("#comment").value=""
   }
</script>

		<!-- 댓글영역 end-->
		<table>
			<tr>
				<td colspan="2" class="text-right"><a class="btn btn-primary"
					href="${pageContext.request.contextPath}/board/boardUpdateForm?num=${board.pnum}">변경</a>
					<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/board/boardDeleteForm?num=${board.pnum}">삭제</a>
					<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/board/boardList">목록</a></td>
			</tr>
		</table>
	</div>

	<script>
	function openPurchasePopup() {
	    var width = 400;
	    var height = 300;
	    var left = (window.innerWidth - width) / 2;
	    var top = (window.innerHeight - height) / 2;

	    var purchasePopup = window.open('', 'purchasePopup', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top + ',scrollbars=yes,resizable=yes');

	    // 여기에 구매 양식을 추가하세요.
	    var popupContent = `
	        <h2>입찰양식</h2>
	        <form action="구매처리 스크립트 URL" method="post">
	            <!-- 구매 양식의 필드들을 추가하세요. -->
	            <label for="productName">상품명:</label>
	            <input type="text" value="${board.pname}" id="" name="pname" readonly><br>

	            <label for="productName">경매시작가:</label>
	            <input type="text" value="${board.price}" id="" name="" readonly><br>

	            <label for="productName">입찰희망가:</label>
	            <input type="text" id="" name="wishprice"><br>

	            <button type="submit">구매하기</button>
	        </form>
	    `;
	    purchasePopup.document.write(popupContent);
	}

</script>

</body>
</html>
