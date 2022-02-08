<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />

<div>
	<main>
		<div>
			<h2>TV 감상평 등록</h2>
		</div>

		<div>
			<div>
				<h4>Input product information</h4>
				<form action="/tvBoard/register" method="post">
					<div>
						<div>
							<input type="text" placeholder="search" id="search">
							<button type="button" id="searchBtn">검색</button>
						</div>
						<div>
							<button type="button" id="likeBtn">재미있어요</button>
							/
							<button type="button" id="hateBtn">재미없어요</button>
							<input type="hidden" name="likeHate" id="likeHate">
						</div>
						<div>
							<label for="title">제목</label> <input type="text" name="title"
								id="title" placeholder="제목을 적으세요.">
						</div>

						<div>
							<label for="email">작성자</label>
							<div>
								<input type="email" name="writer" id="writer"
									value="test@test.com">
							</div>
						</div>

						<div>
							<label for="cont">내용</label>
							<textarea name="content" id="desc" placeholder="내용을 적으세요."></textarea>
						</div>
					</div>
					<div id="tvArea"></div>
					<button id="regBtn" type="submit">등록</button>
				</form>
			</div>
		</div>
	</main>
</div>
<script src="/resources/js/tvBoard.register.js"></script>
<jsp:include page="../common/footer.jsp" />