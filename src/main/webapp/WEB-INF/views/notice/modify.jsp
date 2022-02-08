<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>공지사항 수정</h1>

<form action="/notice/modify" method="post">
	<input type="hidden" name="nid" id="nid" value="${nvo.nid }">
	<label for="email">작성자</label>
	<input type="email" name="email" id="email" value="${nvo.email }">  
	<label for="title">제목</label>
	<input type="text" name="title" id="title" value="${nvo.title }">              
	<label for="cont">Content</label>
	<textarea name="content" id="cont">${nvo.content }</textarea>
	<button type="submit">변경</button>
</form>

<jsp:include page="../common/footer.jsp" />