<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>영화 감상평 수정</h1>

<c:set var="mbvo" value="${mbdto.mbvo }" />
<sec:authentication property="principal.uvo.email" var="authEmail"/>

<form action="/mBoard/modify" method="post">
	<input type="hidden" name="authEmail" id="authEmail" value="${authEmail }">
	<input type="hidden" name="mbId" id="mbId" value="${mbvo.mbId }">
	<label for="writer">작성자</label>
	<input type="email" name="writer" id="writer" value="${mbvo.writer }">  
	<label for="title">제목</label>
	<input type="text" name="title" id="title" value="${mbvo.title }">              
	<label for="cont">Content</label>
	<textarea name="content" id="cont">${mbvo.content }</textarea>
	<button type="submit">변경</button>
</form>
<jsp:include page="../common/footer.jsp" />