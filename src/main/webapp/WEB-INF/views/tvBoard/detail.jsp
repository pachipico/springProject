<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>TV 감상평 디테일</h1>

<c:set var="tvbvo" value="${tvbdto.tvbvo }" />

<label for="email">작성자</label>
<input type="email" name="writer" id="writer" value="${tvbvo.writer }" readonly>
<label for="regAt">최초 작성 일자</label>
<input type="text" value="${tvbvo.regAt }" readOnly>              
<label for="modAt">수정 일자</label>
<input type="text" value="${tvbvo.modAt }" readOnly>              
<label for="readCount">조회수</label>
<input type="text" value="${tvbvo.readCount }" readOnly>              
<label for="title">제목</label>
<input type="text" name="title" id="title" value="${tvbvo.title }" readOnly>
<img src="${tvbvo.poster }"> 
<label for="cont">Content</label>
<textarea name="content" id="cont" readOnly>${tvbvo.content }</textarea>


<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.uvo.email" var="authEmail"/>
<input type="hidden" name="heartCheck" id="heartCheck" value="${tvbdto.check }">
<input type="hidden" name="authEmail" id="authEmail" value="${authEmail }">
	<c:choose>
		<c:when test="${authEmail == tvbvo.writer }">
			<button type="button" id="heartList">♡</button>
		</c:when>
		<c:when test="${authEmail != null && tvbdto.check == 1 }">
			<button type="button" id="heartBtn">♥</button>
		</c:when>
		<c:otherwise>
			<button type="button" id="heartBtn">♡</button>
		</c:otherwise>
	</c:choose>
</sec:authorize>

<sec:authorize access="isAnonymous()">
	<span>♡</span>
</sec:authorize>

<div id="heartListArea">

</div>


<h2>댓글</h2>
<input type="text" id="cmtWriter" name="cmtWriter" value="댓글test">
<input type="text" id="cmtText" placeholder="댓글을 입력해주세요.">
<button type="button" id="cmtPostBtn">게시</button>

<ul id="cmtListArea">

</ul>

<div id="cmtPaging">
	<ul>
		<li>
			<a href="" class="page-link">이전</a>
		</li>
		<li>
			<a href="" class="page-link"></a>
		</li>
		<li>
			<a href="" class="page-link">다음</a>
		</li>
	</ul>
</div>



              
<a href="/tvBoard/${tvbvo.likeHate == 1 ? 'like' : 'hate' }List?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&keyword=${pgvo.keyword}">목록</a>
<a href="/tvBoard/modify?tvbId=${tvbvo.tvbId }&authEmail=${authEmail }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&keyword=${pgvo.keyword}">수정</a>
<button type="button" id="delBtn">삭제</button>

<form action="/tvBoard/remove" method="post" id="delForm">
	<input type="hidden" name="tvbId" value="${tvbvo.tvbId }">
	<input type="hidden" name="likeHate" value="${tvbvo.likeHate }">
	<input type="hidden" name="pageNo" value="${pgvo.pageNo }">
    <input type="hidden" name="qty" value="${pgvo.qty }">
    <input type="hidden" name="type" value="${pgvo.type }">
    <input type="hidden" name="keyword" value="${pgvo.keyword }">
</form>
<script>
	const tvbIdVal = document.querySelector("input[name=tvbId]").value;
	const heartCheck = document.getElementId('heartCheck').value;
	const authEmail = document.getElementId('authEmail').value;
</script>
<script src="/resources/js/tvBoard.detail.js"></script>
<script src="/resources/js/tvBoard.comment.js"></script>
<jsp:include page="../common/footer.jsp" />