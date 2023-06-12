<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
div.content {
	min-height: 300px;
}

div.fr {
	text-align: right;
}

#cmt {
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal2.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal2_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(0%) translateY(0%);
}
</style>


<script type="text/javascript">
$(function() {
	$(".commInput").hide()
	$(".commBtnInput").hide()
})

function updateComment(th){
	
	$(".commBtnInput").children(":nth-child(2)").each(function() {
		cancel(this)
	})

	var commentText = $(th).parents("tr").find(".commContent").text().trim()
	
	$(th).parents("tr").find(".commContent").hide()
	$(th).parents("tr").find(".commBtnComment").hide()
	
	$(th).parents("tr").find(".commInput").children().val( commentText )
	$(th).parents("tr").find(".commInput").show()
	$(th).parents("tr").find(".commBtnInput").show()
}

function cancel(th) {
	console.log("cancel")
	
	$(th).parents("tr").find(".commContent").show()
	$(th).parents("tr").find(".commBtnComment").show()
	
	$(th).parents("tr").find(".commInput").hide()
	$(th).parents("tr").find(".commBtnInput").hide()
}

function updateCom(th, commNo) {
	console.log("클릭")
	console.log(commNo)	
	console.log($(th).parents("#commentTr").find(".commUpdateContent"+commNo).val())
	
	
	var commentText = $(th).parents("#commentTr").find(".commUpdateContent"+commNo).val()
	
	console.log(commentText)
	
	if(commentText == ""){
		commentText = " "
	}
	
	$.ajax({
		type: "get"
		, url: "./updateComment"
		, dataType: "html"
		, data: {
			commNo: commNo
			, commContent: commentText
			, freeboardNo: ${board.freeboardNo} 
		}
		, success: function(data){
			$("#commentTr").html(data)
		}
		, error: function() {
			console.log("error")
		}
	})
}
</script>
<table id="commentTr">
<c:forEach var="boardCommentList" items="${boardCommentList }">
<tr>
	<td><i class="bi bi-person-circle"></i>${viewUser.userNick }<td> 
	<td class="comm">
		<div class="commContent">
			${boardCommentList.commContent }
		</div>
		<div class="commInput">
			<input class="commUpdateContent${boardCommentList.commNo}" type="text" name="commUpdateContent">
		</div>
	</td>
	<td><fmt:formatDate value="${boardCommentList.commDate }" pattern="yy/MM/dd hh:mm"/></td>
	
	<td class="commBtn">
		<c:if test="${not empty userno and userno eq boardCommentList.userNo || not empty adminLogin and adminLogin}">
			<div class="commBtnComment">
				<button type="button" onclick="updateComment(this)" class="btn btn-secondary">수정</button>
				<a href="./commentDelete?commNo=${boardCommentList.commNo}&freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-secondary">삭제</button></a>
			</div>
			<div class="commBtnInput">
				<button onclick="updateCom(this, ${boardCommentList.commNo})" class="btn btn-secondary">완료</button> 
				<button onclick="cancel(this)" class="btn btn-secondary">>취소</button>
			</div>
		</c:if>
	</td>
</tr>
</c:forEach>
</table>