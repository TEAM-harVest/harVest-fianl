<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.payment.db.PaymentDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwillbs.cart.db.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.cart.db.CartDTO"%>
<%@page import="com.itwillbs.cart.action.CartList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment/payment.jsp</title>
<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<h1>주문 결제 페이지</h1>
<!-- - 장바구니에서 결제 페이지로 넘어오는 루트 -->
<%
String cus_id=(String)session.getAttribute("cus_id");

// cus_id가 null(세션값이 없으면) loginForm.jsp 이동
if(cus_id == null) {
	response.sendRedirect("./LoginForm.ca");
}


List<CartDTO> cartList
=(List<CartDTO>)request.getAttribute("cartList");


String menu_name="";
CartDAO dao = new CartDAO();

DecimalFormat df = new DecimalFormat("###,###");
int sum = 0;
%>

<form class = "payment" action="./PaymentPro.pa" method="post">
<table border="1">
<tr><td>no.</td><td>상품정보</td>
    <td>수량</td><td>금액</td></tr>
    <%
    for(int i=0; i<cartList.size(); i++){
//     	MemberDTO dto=(MemberDTO)memberList.get(i);
//      참조형의 형변환 없이 가져옴
		CartDTO dto=cartList.get(i);
		int menu_num = dto.getMenu_num();
		int crt_num = dto.getCrt_num();
		menu_name = dao.getMenuName(menu_num, crt_num);
    	%>
<tr><td><input type="text" id="crt_num_<%=i%>" name="crt_num" class="crt_num" value="<%=dto.getCrt_num() %>" readonly></td>
    <td>
    <input type="text" name="menu_num" id="menu_num_<%=i%>" class="menu_num" value="<%=dto.getMenu_num() %>" readonly> <!-- TODO 체크박스변경 -->
    <input type="text" name="menu_img" class="menu_img" value="이미지 사진 띄우기!!!!!!">
    <input type="text" name="menu_name" class="menu_name" value="<%=menu_name %>" readonly>
    </td>
    <td>
    <input type="text" id="pay_count_<%=i%>" name="pay_count" class="pay_count" value="<%=dto.getCrt_count() %>" readonly>
    </td>
    <td><input type="text" id="pay_price_<%=i%>" name="pay_price" class="pay_price" value="<%=dto.getCrt_price() %>" readonly></td>
    <%
    sum += dto.getCrt_count() * dto.getCrt_price();
    
    // 주문테이블에도 메뉴별로 수량과 가격이 insert 되어야 하므로 list로 보냄
    PaymentDTO payDto = new PaymentDTO();
    List<PaymentDTO> payList = new ArrayList<PaymentDTO>();
    payDto.setMenu_num(dto.getMenu_num());
    payDto.setPay_count(dto.getCrt_count());
    payDto.setPay_price(dto.getCrt_price());
    // 근데 이렇게 보내도 되나.. 싶은..ㅎㅎ 잘 모르겠어요,,,
    request.setAttribute("payList", payList);
    }
    %>
</table>
<h3>픽업 시간</h3>
 <input type="radio" name="pick_up" value="1분내"> 1분내
 <input type="radio" name="pick_up" value="5분"> 5분
 <input type="radio" name="pick_up" value="10분"> 10분
 <input type="radio" name="pick_up" value="15분"> 15분
 <input type="radio" name="pick_up" value="20분"> 20분
 <hr>
 <h3>최종 결제 금액 : <b><%=df.format(sum) %></b> 원</h3>
</form>
<input type="button" value="돌아가기" onclick="location.href='./CartList.ca'">
<input type="button" value="결제하기" onclick="requestPay()">
<script type="text/javascript">
function requestPay() {
	var IMP = window.IMP;  
	IMP.init('imp84126554'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
	    pg: 'html5_inicis',
	    pay_method: "card",
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : '<%=menu_name %>' + ' 외 ' + <%=4-1 %> + '건' ,	// 상품 이름
	    amount : <%=sum %>,		// 가격
	    buyer_name : '<%=cus_id %>',
	  }, function (rsp) { // callback
	      if (rsp.success) {
	    	  var msg = "결제가 완료되었습니다.";
	    	  alert(msg);
	    	  $(".payment").submit();
	    	  
	      } else {
	    	  var msg = '결제에 실패하였습니다.\n';
	          msg += '에러내용 : ' + rsp.error_msg;
	          alert(msg);
	      }
	  });
	}

</script>
</body>
</html>