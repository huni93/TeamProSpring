<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<div class="wrap">

	<div id="mypage">


		<div class="center_cover">
		<ul class="center_menu">
				<li>
					<div class="order_title_table">
						마이페이지
						<p class="en">MYPAGE</p>
					</div>
				</li>
				<li>
					<div class="guide_category">
						<div class="item">
							<p class="tit">경매내역</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/board/buyList">입찰 중 / 입찰완료
									상품</a> <a href="${pageContext.request.contextPath}/jumun/myList">판매등록상품</a>
								<a href="${pageContext.request.contextPath}/jumun/jumunList">찜한상품</a>
							</p>
						</div>
						
						
						<div class="item">
							<p class="tit">회원정보</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/member/tier" title="">나의등급</a> <a
									href="${pageContext.request.contextPath}/member/memberinfo">회원정보 보기 / 수정</a> <a
									href="${pageContext.request.contextPath}/member/memberDeleteForm">회원탈퇴</a>
							</p>
						</div>
						<div class="item">
							<p class="tit">고객센터</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/notice/noticeList?boardid=1">공지사항</a>
								<a href="${pageContext.request.contextPath}/notice/noticeList?boardid=2">자주묻는질문</a>
								<a href="${pageContext.request.contextPath}/notice/noticeList?boardid=3">1:1문의</a>
									<a href="${pageContext.request.contextPath}/notice/mynotice">나의 1:1 문의글</a>
							</p>
						</div>
					</div>
				</li>
			</ul>
			<ul class="mypage_title">
				<li class="mypage_info_box">
					<div class="item">
						<p class="txt" style="margin-bottom: 5px;">WELCOME</p>
						<p class="txt">
							아이디<br><span class="num" style="font-weight:bold;">${amem.id }</span>
						</p>
						


					</div>
					
						<div class="item">
					
						<p class="txt" style="margin-top: 18px; ">
							등급<br>  <span class="num" style="font-weight:bold;">${Tier}</span>

						
						</p>
					</div>
					<div class="item">
					
						<p class="txt" style="margin-top: 18px;">
							마일리지<br>  <span class="num" style="font-weight:bold;">${sum }원</span>

						
						</p>
					</div>
					<div class="item">
						<p class="txt" style="position: relative;">
							쿠폰<br> <a href="/mypage/my_coupon"> <span class="num">2</span>
								<span class="sb">개</span>
							</a> <a href="/coupon" class="coupon_down">쿠폰다운로드</a>
						</p>
						<p class="txt" style="margin-top: 18px; position: relative;">
							입찰보증금<br> <a href="/mypage/my_auction_ticket"> <span
								class="num">${amem.money }</span> <span class="sb">원</span>
							</a> <a href="/mypage/pay_return" class="refund">환불</a>
						</p>
					</div>
					<div class="item">
						<p class="txt">충전</p>
						<p class="cash_img">
							<a href="/mypage/auction_pay_add"> <img
								src="${pageContext.request.contextPath}/image/renew220916/cash_img01.png"
								alt="입찰보증금충전" style="margin-left: 5px;">
							</a>
						</p>
					</div>
				</li>



			
					<li>
						<table class="mypage_table_head">
							<caption>
								회원탈퇴
							
							</caption>
							<tr>
						<td colspan="2" style="border-bottom:none;letter-spacing:-1px;" class="retire"><span>이용해 주셔서 감사합니다.사이트 이용 중 불편한 점이 있으셨다면 더욱 좋은 서비스를 제공해드릴 수 있도록 노력하겠습니다.</span></td>
					</tr>
						</table>
						<div>&nbsp;<br>&nbsp;</div>
						<form class="validation-form" novalidate action="memberDeletePro">
				
						<table class="indiv_table" style="width:30%; margin:auto; margin-top:50px;">
							<colgroup>
								<col width="40%">
								<col width="60%">
							</colgroup>
							<tbody>
								<tr>
									<th>아이디</th>
									<td style="height: 25px;"><input type="text" class="form-control" id="id" placeholder="ID" value="${amem.id}" readonly name="id"></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td style="height: 25px;">	<input type="password" class="form-control" id="pass" placeholder="PASSWORD" value="" name="pass" required>
						</td>
								</tr>
								

								<tr>
									<td colspan="2" class="austria">
									
										<button class="lo" type="submit" style="padding:10px; width:100px; background-color:#DC3224; border:none; color:white;">탈퇴</button>
											</td>
								</tr>
								<!--
				
					-->
							</tbody>
						</table>
						</form>
					</li>



				</form>
			</ul>
		</div>


	</div>
</div>
</html>
