<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
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
          <button type="button" data-genre="10759" class="btn btn-outline-secondary genreBtn">
            액션/어드벤쳐
          </button>
          <button type="button" data-genre="16" class="btn btn-outline-secondary genreBtn">애니메이션</button>
          <button type="button" data-genre="35" class="btn btn-outline-secondary genreBtn">코미디</button>
          <button type="button" data-genre="80" class="btn btn-outline-secondary genreBtn">범죄</button>
          <button type="button" data-genre="99" class="btn btn-outline-secondary genreBtn">다큐</button>
          <button type="button" data-genre="18" class="btn btn-outline-secondary genreBtn">드라마</button>
          <button type="button" data-genre="10751" class="btn btn-outline-secondary genreBtn">가족</button>
          <button type="button" data-genre="10762" class="btn btn-outline-secondary genreBtn">kids</button>
          <button type="button" data-genre="9648" class="btn btn-outline-secondary genreBtn">미스테리</button>
          <button type="button" data-genre="10763" class="btn btn-outline-secondary genreBtn">뉴스</button>
          <button type="button" data-genre="10764" class="btn btn-outline-secondary genreBtn">
            리얼리티
          </button>
          <button type="button" data-genre="10765" class="btn btn-outline-secondary genreBtn">
            SF/판타지
          </button>
          <button type="button" data-genre="10766" class="btn btn-outline-secondary genreBtn">soap</button>
          <button type="button" data-genre="10767" class="btn btn-outline-secondary genreBtn">토크</button>
          <button type="button" data-genre="10768" class="btn btn-outline-secondary genreBtn">
            전쟁/정치
          </button>
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
<script>
let platform = `<c:out value="${platform}"/>`
console.log(platform);
</script>
<script src="/resources/js/tv.list.js"></script>


