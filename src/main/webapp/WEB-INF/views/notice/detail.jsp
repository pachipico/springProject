<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>공지사항 디테일</h1>


<label for="email">작성자</label>
<input type="email" name="email" id="email" value="${nvo.email }" readonly>
<label for="regAt">최초 작성 일자</label>
<input type="text" value="${nvo.regAt }" readOnly>              
<label for="modAt">수정 일자</label>
<input type="text" value="${nvo.modAt }" readOnly>              
<label for="readCount">조회수</label>
<input type="text" value="${nvo.readCount }" readOnly>              
<label for="title">제목</label>
<input type="text" name="title" id="title" value="${nvo.title }" readOnly>              
<label for="cont">Content</label>
<textarea name="content" id="cont" readOnly>${nvo.content }</textarea>
              
<a href="/notice/list?pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&keyword=${pgvo.keyword}">목록</a>
<a href="/notice/modify?nid=${nvo.nid }&pageNo=${pgvo.pageNo }&qty=${pgvo.qty}&type=${pgvo.type}&keyword=${pgvo.keyword}">수정</a>
<button type="button" id="delBtn">삭제</button>

<form action="/notice/remove" method="post" id="delForm">
	<input type="hidden" name="nid" value="${nvo.nid }">
	<input type="hidden" name="pageNo" value="${pgvo.pageNo }">
    <input type="hidden" name="qty" value="${pgvo.qty }">
    <input type="hidden" name="type" value="${pgvo.type }">
    <input type="hidden" name="keyword" value="${pgvo.keyword }">
</form>

<script src="/resources/js/notice.detail.js"></script>
<jsp:include page="../common/footer.jsp" />