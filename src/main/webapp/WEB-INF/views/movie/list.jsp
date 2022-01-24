<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="common/header.jsp" />




<jsp:include page="common/footer.jsp" /> --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
      integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/resources/css/index.css" />
    <link rel="stylesheet" href="/resources/css/list.css" />
    <title>Document</title>
  </head>
  <body>
    <jsp:include page="../common/nav.jsp" />
    <div class="container">
      <div class="optionContainer">
        <div class="selectContainer">
          <select name="orderBy" id="orderBy">
            <option value="popularity.desc">인기도 내림차순</option>
            <option value="popularity.asc">인기도 오름차순</option>
            <option value="vote_average.desc">평점 내림차순</option>
            <option value="vote_average.asc">평점 오름차순</option>
            <option value="release_date.desc">상영일 내림차순</option>
            <option value="release_date.asc">상영일 오름차순</option>
            <option value="original_title.asc">제목순</option>
          </select>
        </div>
        <div class="btnContainer">
          <button type="button" data-genre="28" class="btn btn-outline-secondary genreBtn">액션</button>
          <button type="button" data-genre="12" class="btn btn-outline-secondary genreBtn">어드벤쳐</button>
          <button type="button" data-genre="16" class="btn btn-outline-secondary genreBtn">애니메이션</button>
          <button type="button" data-genre="35" class="btn btn-outline-secondary genreBtn">코미디</button>
          <button type="button" data-genre="80" class="btn btn-outline-secondary genreBtn">범죄</button>
          <button type="button" data-genre="99" class="btn btn-outline-secondary genreBtn">다큐</button>
          <button type="button" data-genre="18" class="btn btn-outline-secondary genreBtn">드라마</button>
          <button type="button" data-genre="10751" class="btn btn-outline-secondary genreBtn">가족</button>
          <button type="button" data-genre="14" class="btn btn-outline-secondary genreBtn">판타지</button>
          <button type="button" data-genre="36" class="btn btn-outline-secondary genreBtn">역사</button>
          <button type="button" data-genre="27" class="btn btn-outline-secondary genreBtn">호러</button>
          <button type="button" data-genre="10402" class="btn btn-outline-secondary genreBtn">음악</button>
          <button type="button" data-genre="9648" class="btn btn-outline-secondary genreBtn">미스테리</button>
          <button type="button" data-genre="10749" class="btn btn-outline-secondary genreBtn">로맨스</button>
          <button type="button" data-genre="878" class="btn btn-outline-secondary genreBtn">SF</button>
          <button type="button" data-genre="10770" class="btn btn-outline-secondary genreBtn">tv영화</button>
          <button type="button" data-genre="53" class="btn btn-outline-secondary genreBtn">스릴러</button>
          <button type="button" data-genre="10752" class="btn btn-outline-secondary genreBtn">전쟁</button>
          <button type="button" data-genre="37" class="btn btn-outline-secondary genreBtn">서부</button>
        </div>
        <div class="keywordContainer"></div>
      </div>
      <div id="cardContainer" class="row"></div>
      <button id="moreBtn">more</button>
    </div>
    <button id="searchBtn" style="visibility: hidden">검색</button>
  </body>
</html>
<script src="list.js"></script>


<script>
	let sortBy = `<c:out value="${sortBy}" />`
	
</script>
<script src="/resources/js/movie.list.js"></script>