<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

    <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>


<script type="text/javascript">
document.cookie = "safeCookie1=foo; SameSite=Lax"; 


IMP.init("imp25445063");

function requestPay(){
    IMP.request_pay({
        pg : 'tosstest',
        pay_method : 'card',
        merchant_uid: "order_no_0001", //�������� ������ ���� �ֹ���ȣ
        name : '�ֹ� ��:�����׽�Ʈ',   //�ʼ� �Ķ���� �Դϴ�.
        amount : 1004,
        buyer_email : 'iamport@siot.do',
        buyer_name : '�������̸�',
        buyer_tel : '010-1234-5678',
        buyer_addr : '����Ư���� ������ �Ｚ��',
        buyer_postcode : '123-456',
    }, function(rsp) { // callback ����
    	//* ...�߷� (README ���Ͽ��� �� �����ڵ带 Ȯ���ϼ���)... *//
    });
    
}

	
</script>
<body>
dd

<button onclick="requestPay()">����</button>
</body>
</html>