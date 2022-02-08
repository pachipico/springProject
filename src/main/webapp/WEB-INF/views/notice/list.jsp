<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h1>공지사항 목록</h1>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.uvo.authList" var="auths"/>
<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_USER')).get() }">
			<a href="/notice/register">REG</a>
</c:if>
</sec:authorize>

<a href="/notice/register">공지사항 등록</a>

<table>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">조회수</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="nvo">
    <tr>
      <th scope="row">${nvo.nid }</th>
      <td><a href="/notice/detail?nid=${nvo.nid }&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">${nvo.title }</a></td>
      <td>${nvo.email }</td>
      <td>${nvo.readCount }</td>
      <td>${nvo.modAt }</td>
    </tr>
    </c:forEach>    
  </tbody>
</table>

<ul>
	<c:if test="${pgn.prev }">
		<li>
			<a href="/notice/list?pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">이전</a>
		</li>
	</c:if>
	<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
		<li class="${pgn.pgvo.pageNo == i ? 'active':''}">
			<a href="/notice/list?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">${i }</a>
		</li>
	</c:forEach>
	<c:if test="${pgn.next }">
		<li>
			<a href="/notice/list?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">다음</a>
		</li>
	</c:if>
</ul>

<script>
	let isUp = '<c:out value="${isUp}"/>';
	if (parseInt(isUp)) {
		alert('공지사항 등록 완료');
	}
</script>

<jsp:include page="../common/footer.jsp" />