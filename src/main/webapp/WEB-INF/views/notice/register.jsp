<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<form action="/notice/register" method="post">
	<label for="email">작성자</label>
	<input type="email" id="email" name="email" value="admin@admin.com">
	<br>
	<label for="title">제목</label>
	<input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
	<br>
	<label for="content">내용</label>
	<textarea id="content" name="content" placeholder="내용을 입력하세요" required></textarea>
	<br>
	<button type="submit">게시</button>
</form>

<jsp:include page="../common/footer.jsp" />