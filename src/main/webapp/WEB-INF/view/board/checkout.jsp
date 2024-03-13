<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="mypage">
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<script>
    function showBankInfo() {
        var bankInfo = document.getElementById("bankInfo");

        // 계좌이체를 선택하면 추가적인 창을 나타냄
        bankInfo.style.display = "block";
    }

    function hideBankInfo() {
        var bankInfo = document.getElementById("bankInfo");

        // 다른 결제수단을 선택하면 추가적인 창을 숨김
        bankInfo.style.display = "none";
    }
</script>
<script>
function handleMemoChange() {
    var select = document.getElementById("memoSelect");
    var input = document.getElementById("customMemoInput");
    var selectedValue = select.value;

    if (selectedValue === "직접입력") {
        input.style.display = "block";
        input.value = "";  // 직접 입력을 위해 input을 비웁니다.
    } else {
        input.style.display = "none";
        input.value = selectedValue;  // select의 값을 input에 설정합니다.
    }
}

// 서버로 데이터 전송하기 전에 호출되는 함수
function prepareAndSendData() {
    var memo = document.getElementById("customMemoInput").value;

    // 서버에 데이터 전송하는 로직
    // 예: window.location.origin + "${pageContext.request.contextPath}/board/checkoutpro?num=${board.pnum}&pnum=${board.pnum}&memo=" + memo;
}

</script>
	<style media="screen">
.btn_vietnam {
	width: 100%;
}

.wrapper {
	max-width: 700px;
	margin: 10px auto; /* 상하 여백은 auto로 설정하여 중앙 정렬 */
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	text-align: center;
	color: black;
}
</style>



	<div class="basket_title">
		<div class="basket_title_cover">예상비용결제(1차결제)</div>
	</div>
	<div class="basket_menu">
		<div class="basket_notice">
			<div class="bn_img">
				<img src="/images/renew220916/notice.png" alt="알림">
			</div>
			<div class="bn_txt">
				상품이 현지의 당사 물류센터에 도착전, 무게와 기타 경비등을 추정하여 결제를 진행합니다.<br> 상품의 실무게
				측정후 추가 입금액 또는 환불금이 발생할 수 있습니다.
			</div>
		</div>
		<ul>
			<li><span>1</span> 장바구니</li>
			<li class="on"><span>2</span> 예상비용결제</li>
			<li><span>3</span> 주문완료</li>
			<li><span>4</span> 실비정산</li>
			<li><span>5</span> 결제완료</li>
		</ul>
	</div>


	<div class="basket_box">
		<div class="basket_box_left">
			<div style="margin-top: 80px;">
				<form action="https://japaning.co.kr/pay/order_result"
					name="order_frm" id="order_frm" method="post"
					accept-charset="utf-8">
					<div id="order">
						<ul class="order_title">
							<li>
								<table class="order_goods_table_head">
									<tbody>
									</tbody>
									<colgroup>
										<col width="120px;">
										<col width="120px;">
										<col width="">
										<!-- <col width="90px;" /> -->
										<col width="120px;">
										<col width="140px;">
										<col width="120px;">
									</colgroup>
									<tbody>
										<tr>
											<td>상품번호</td>
											<td>등록일자</td>
											<td>상품정보</td>
											<!-- <td>단가(세별)</td> -->
											<td>입찰자</td>
											<td>상품가</td>
											<td style="background: #FBFBFB;">진행상태</td>
										</tr>
									</tbody>
								</table>
								<table class="order_goods_table_body">
									<tbody>
									</tbody>
									<colgroup>
										<col width="120px;">
										<col width="120px;">
										<col width="">
										<!-- <col width="90px;" /> -->
										<col width="120px;">
										<col width="140px;">
										<col width="120px;">
									</colgroup>
									<tbody>
										<tr>
											<td><span style="color: #ED564D;">${board.pnum }</span>
											</td>
											<td><fmt:formatDate value="${board.idate}"
													pattern="yyyy년 MM월 dd일 HH시" /></td>
											<td class="china"><span class="china_bk"> <span
													class="cbi"> <a href="boardInfo?num=${board.pnum}">
															<img
															src="${pageContext.request.contextPath}/image/board/${board.file1}">
													</a>
												</span>
											</span> <span class="china_sh"> <a href="" target="_blank">
														${board.pname } </a> <!--
			      								      					--> <span class="in"> 판매자 :
														${board.userid } </span>
											</span> <span class="china_nj"> ${board.subject}</span></td>
											<!-- <td><strong>4,164</strong> 円</td> -->
											<td>${board.buyid }</td>
											<td><strong style="color: #ED564D;"><span>
														<fmt:formatNumber value="${board.buy}" pattern="#,##0" />
												</span>원</strong></td>
											<td>결제대기</td>
										</tr>
									</tbody>
								</table>
							</li>

							<li style="height: 15px;"></li>

							<li>
								<table class="order_location_table_head">
									<tbody>
									</tbody>
									<colgroup>
										<col width="50%;">
										<col width="50%;">
									</colgroup>
									<tbody>
										<tr>
											<td>주문하신 분</td>
											<td style="background: #FBFBFB;">결제정보</td>
										</tr>
									</tbody>
								</table>

								<table class="order_location_table_body">
									<tbody>
									</tbody>
									<colgroup>
										<col width="60%;">
										<col width="40%;">
									</colgroup>
									<tbody>
										<tr>
											<td>
												<table class="order_info_table">
													<tbody>
													</tbody>
													<colgroup>
														<col width="28%;">
														<col width="">
													</colgroup>
													<tbody>
														<tr>
															<th>이름</th>
															<td><input type="text" class="input_name"
																maxlength="10" value="소성운" name="realname"></td>
														</tr>
														<tr>
															<th>주소</th>
															<td><input type="text" class="input_add"
																name="user_zipcode" id="user_zipcode"
																readonly="readonly" value="17001"> &nbsp;
																<button type="button" class="btn_addno cursor_p"
																	onclick="goPopup('2')">우편번호 찾기</button> <br> <input
																type="text" class="input_addlong"
																style="margin-top: 3px;" name="user_address"
																id="user_address" value="경기도 용인시 기흥구 평촌2로1번길 8-17"
																readonly="readonly"> <br> <input
																type="text" class="input_addlong"
																style="margin-top: 3px;" name="user_address_detail"
																id="user_address_detail" value="1"> <input
																type="hidden" name="user_address_en"
																id="user_address_en"
																value="8-17 Pyeongchon 2-ro 1beon-gil, Giheung-gu, Yongin-si, Gyeonggi-do"
																readonly="readonly"> <input type="hidden"
																name="user_address_detail_en"
																id="user_address_detail_en" value="1"></td>
														</tr>
														<tr>
															<th>이메일</th>
															<td><input type="text" class="input_email"
																value="tjddns1117" name="user_email1" id="user_email1">
																＠ <input type="text" class="input_email"
																value="naver.com" name="user_email2" id="user_email2">
															</td>
														</tr>
														<tr>
															<th>일반전화</th>
															<td>
																<div id="select_boxtel" style="margin: 0;">
																	<label for="color">010</label> <select name="user_tel3"
																		id="select_boxtel">
																		<option value="010" selected="selected">010</option>

																	</select>
																</div> - <input type="text" class="input_tel" value="8461"
																name="user_tel2" id="user_tel2"> - <input
																type="text" class="input_tel" value="4827"
																name="user_tel3" id="user_tel3">
															</td>
														</tr>
														<tr>
															<th>휴대전화</th>
															<td>01084614827</td>
														</tr>
														<tr>
															<td colspan="2"
																style="border-bottom: none; letter-spacing: -1px;">※
																휴대전화번호는 마이페이지 &gt; 개인정보수정을 통해서만 변경이 가능합니다.</td>
														</tr>
													</tbody>
												</table>
											</td>


											<td style="padding: 0 120px 30px 120px;">
												<table class="order_amount_table">
													<tbody>
													</tbody>
													<colgroup>
														<col width="50%;">
														<col width="50%;">
													</colgroup>
													<tbody>
														<tr>
															<td colspan="2" class="oat_title">결제 금액</td>
														</tr>
														<tr>
															<td colspan="2" class="oat_line"></td>
														</tr>
														<tr>
															<td class="oat_order">총 주문금액</td>
															<td class="oat_orderprice">￦ <strong id="total_won2">63,984</strong></td>
														</tr>
														<tr>
															<td>할인사용</td>
															<td class="oat_price" style="color: #ED564D;">￦ <span
																id="use_discount_prt"><b>0</b></span></td>
														</tr>
														<!--
          							<tr>
          								<td>포인트사용</td>
          								<td class="oat_price" >￦ <span id="use_point_prt">0</span></td>
          							</tr>
          							-->
														<tr style="display: none;">
															<td>입찰선납금 사용</td>
															<td class="oat_price">￦ <span id="use_prepay_prt"><b>0</b></span></td>
														</tr>
														<tr>
															<td style="padding-bottom: 10px;">캐시사용</td>
															<td class="oat_price">￦ <span id="use_cash_prt"><b>0</b></span></td>
														</tr>
														<tr>
															<td colspan="2" class="oat_line"></td>
														</tr>
														<tr>
															<td class="oat_order2">총 결제금액</td>
															<td class="oat_orderprice2">￦ <span
																id="step3_total_price">63,984</span></td>
														</tr>
														<tr>
															<td colspan="2" class="oat_btns" id="credit_ok">
																<button type="button" class="btn_vietnam cursor_p"
																	id="buy_btn" onclick="$('#order_frm').submit();">결제하기</button>
															</td>
														</tr>
														<tr>
															<td colspan="2" class="oat_btns" style="display: none"
																id="credit_loading">
																<button type="button" class="btn_cambodia cursor_p"
																	onclick="alert('결제가 진행중입니다. \n잠시만 기다려주세요.');">결제진행중</button>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</li>

							<li>
								<table class="order_settle_table_head">
									<tbody>
									</tbody>
									<colgroup>
										<col width="100%;">
									</colgroup>
									<tbody>
										<tr>
											<td>결제정보</td>
										</tr>
									</tbody>
								</table>
								<table class="order_settle_table_body">
									<tbody>
									</tbody>
									<colgroup>
										<col width="70%;">
										<col width="30%;">
									</colgroup>
									<tbody>
										<tr>
											<td><input type="text" class="input_name" value="0"
												name="use_prepay" style="display: none;">
											<div class="wrapper">
		<div class="box_section"
			style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px;">
			<!-- 결제 UI -->
			<div id="payment-method"></div>
			<!-- 이용약관 UI -->
			<div id="agreement"></div>
			<!-- 쿠폰 체크박스 -->
			<div style="padding-left: 25px">
				<div class="checkable typography--p">
					<label for="coupon-box"
						class="checkable__label typography--regular"><input
						id="coupon-box" class="checkable__input" type="checkbox"
						aria-checked="true" /><span
						class="checkable__label-text">5,000원 쿠폰
							적용</span></label>
				</div>
			</div>
			<!-- 결제하기 버튼 -->
			<div class="">
				<button class="lo" id="payment-button" style="margin-top: 0px">
					결제하기</button>
			</div>
		</div>
	</div></td>
											<td style="padding: 0 30px 30px 30px;">
												<table class="order_amount_table">
													<tbody>
													</tbody>
													<colgroup>
														<col width="50%;">
														<col width="50%;">
													</colgroup>
													
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</li>
						</ul>
					</div>

				</form>
			</div>
		</div>
	</div>


<script>
      const button = document.getElementById("payment-button");
      const coupon = document.getElementById("coupon-box");
   
      const generateRandomString = () =>
        window.btoa(Math.random()).slice(0, 20);
      const amount = ${board.buy};
     

      const widgetClientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
      const customerKey = generateRandomString();
      const paymentWidget = PaymentWidget(widgetClientKey, customerKey); // 회원 결제
      // const paymentWidget = PaymentWidget(widgetClientKey, PaymentWidget.ANONYMOUS); // 비회원 결제

      // ------  결제 UI 렌더링 ------
      // @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
      paymentMethodWidget = paymentWidget.renderPaymentMethods(
        "#payment-method",
        { value: amount },
        // 렌더링하고 싶은 결제 UI의 variantKey
        // 결제 수단 및 스타일이 다른 멀티 UI를 직접 만들고 싶다면 계약이 필요해요.
        // @docs https://docs.tosspayments.com/guides/payment-widget/admin#멀티-결제-ui
        { variantKey: "DEFAULT" }
      );
      // ------  이용약관 UI 렌더링 ------
      // @docs https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자-옵션
      paymentWidget.renderAgreement("#agreement", { variantKey: "AGREEMENT" });

      // ------  결제 금액 업데이트 ------
      // @docs https://docs.tosspayments.com/reference/widget-sdk#updateamount결제-금액
      coupon.addEventListener("change", function () {
        if (coupon.checked) {
          paymentMethodWidget.updateAmount(amount - 5000);
        } else {
          paymentMethodWidget.updateAmount(bal);
        }
      });
    
      // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
      // @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
      button.addEventListener("click", function () {
        // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
        // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
        let memo = document.querySelector("#customMemoInput").value    
        let sp = document.querySelector("#sp").value
       
           paymentWidget.requestPayment({
            orderId: generateRandomString(),
            orderName: "${board.pname}",
         
            successUrl: window.location.origin + "${pageContext.request.contextPath}/board/checkoutpro?num=${board.pnum}&pnum=${board.pnum}&name=${amem.name}&tel=${amem.tel}&address=${amem.address}&id=${amem.id}&memo="+memo+"&sp="+sp+"&buy="+bal,
            failUrl: window.location.origin + "${pageContext.request.contextPath}/board/fail",
            customerEmail: "customer123@gmail.com",
            customerName: "김토스",
            customerMobilePhone: "01012341234",
            
          });
      });
                 
      function calc() {
          let sum = document.querySelector("#bal2").innerHTML
           let sp = document.querySelector("#sp").value
           let buy=${board.buy}
           console.log(sum, sp, buy)
           sum=parseInt(sum)
           sp=parseInt(sp)
           
           bal = buy - sp
           bal2 = sum - sp
           
           paymentMethodWidget.updateAmount(bal);
          
           
           document.querySelector("#bal").innerHTML=bal
           document.querySelector("#bal2").innerHTML=bal2
       }
    </script>




</div>