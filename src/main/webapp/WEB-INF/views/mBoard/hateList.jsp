<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<h2>영화 감상평</h2>
<a href="/mBoard/register">등록</a>

<div>
	<a href="/mBoard/likeList">재밌어요</a>
	/
	<a href="/mBoard/hateList">재미없어요</a>
</div>
	<form action="/mBoard/hateList" method="get">
		<div>
			<c:set value="${pgn.pgvo.type }" var="typed" />
			<select name="type">
				<option ${typed == null ? 'selected':'' }>선택</option>
				<option value="t" ${typed eq 't' ? 'selected':'' }>제목</option>
				<option value="m" ${typed eq 'm' ? 'selected':'' }>영화제목</option>
				<option value="w" ${typed eq 'w' ? 'selected':'' }>작성자</option>
				<option value="tm" ${typed eq 'tm' ? 'selected':'' }>제목 또는
					영화제목</option>
				<option value="tw" ${typed eq 'tw' ? 'selected':'' }>제목 또는
					작성자</option>
				<option value="mw" ${typed eq 'mw' ? 'selected':'' }>영화제목
					또는 작성자</option>
			</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요."
				value="${pgn.pgvo.keyword }"> <input type="hidden"
				name="pageNo" value="1"> <input type="hidden" name="qty"
				value="${pgn.pgvo.qty }">
			<button type="submit">검색</button>
		</div>
	</form>

	<table>
		<thead>
			<tr>
				<th scope="col">포스터</th>
				<th scope="col">제목</th>
				<th scope="col">좋아요</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<tbody>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.uvo.email" var="authEmail"/>
		</sec:authorize>
			<c:forEach items="${list }" var="mbvo">
				<tr>
					<th scope="row">${mbvo.mbId }</th>
					<td><a
						href="/mBoard/detail?mbId=${mbvo.mbId }&authEmail=${authEmail }&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">
							${mbvo.title } </a></td>		
					<td>${mbvo.heart }</td>
					<td><a href="">${mbvo.writer }</a></td>
					<td>${mbvo.readCount }</td>
					<td>${mbvo.modAt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<ul>
		<c:if test="${pgn.prev }">
			<li class="page-item"><a
				href="/mBoard/hateList?pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
			<li class="${pgn.pgvo.pageNo == i ? 'active':''}"><a
				href="/mBoard/hateList?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">${i }</a>
			</li>
		</c:forEach>
		<c:if test="${pgn.next }">
			<li><a
				href="/mBoard/hateList?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">다음</a>
			</li>
		</c:if>
	</ul>
<script>
	let isUp = '<c:out value="${isUp}"/>';
	let isDel = '<c:out value="${isDel}"/>';
	if (parseInt(isUp)) {
		alert('게시글 등록 성공~');
	}
	if (parseInt(isDel)) {
		alert('게시글 삭제 성공~');
	}
</script>
<jsp:include page="../common/footer.jsp" />