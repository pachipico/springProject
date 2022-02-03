<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/userDetail.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<%-- <jsp:include page="userDetailHeader.jsp" /> --%>
	<div id="header">
      <div id="profileImg"></div>
      <div id="headerInfo">
        <div id="profileEmailDiv"><span id="profileEmail">${uvo.nickName}</span>
        ${fn:split(uvo.regAt, "-")[1] }월
        ${fn:split(uvo.regAt, "-")[0] }년
        부터 회원 </div>
        <div id="scoreDiv">
          <div class="scoreBlock">
            <div class="score"><fmt:formatNumber type="number" pattern="0" value="${movieAvg*10 }" />%</div>
            평균
            <br />
            영화 점수
          </div>
          <div class="scoreBlock">
            <div class="score"><fmt:formatNumber type="number" pattern="0" value="${tvAvg*10 }" />%</div>
            평균
            <br />
            tv 점수
          </div>
        </div>
      </div>
    </div>
    
    <!-- 메뉴 -->
    
    <div class="detailMenu">
      <div class="btn-group">
        <button
          class="menuBtn dropdown-toggle"
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          개요
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/user/${uvo.email }">메인</a></li>
          <sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.uvo.email" var="authEmail"/>          
          <li><a class="dropdown-item" href="/user/modify/${authEmail }">프로필 수정</a></li>
          </sec:authorize>
        </ul>
      </div>
      <div class="btn-group">
        <a class="menuBtn" style="display: flex;align-items:center;" type="button" href="#">포스터</a> <!-- 디테일 메인페이지에서 보여줄	건지? -->
      </div>
      <div class="btn-group">
        <button
          class="menuBtn dropdown-toggle"
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          평가
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/user/${uvo.email }/ratedList">영화</a></li>
          <li><a class="dropdown-item" href="/user/${uvo.email }/ratedList/tv">tv 프로그램</a></li>
        </ul>
      </div>

      <div class="btn-group">
        <button
          class="menuBtn dropdown-toggle"
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          즐겨찾기
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/user/${uvo.email }/likedList">영화</a></li>
          <li><a class="dropdown-item" href="/user/${uvo.email }/likedList/tv">tv 프로그램</a></li>
        </ul>
      </div>
      <div class="btn-group">
        <button
          class="menuBtn dropdown-toggle"
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          리뷰
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/user/${uvo.email }/reviewedList">영화</a></li>
          <li><a class="dropdown-item" href="/user/${uvo.email }/reviewedList/tv">tv 프로그램</a></li>
        </ul>
      </div>
    </div>
      <c:choose>
      	<c:when test="${list eq 'liked' }">
      		 <jsp:include page="list/likedList.jsp" /> 
      	</c:when>
      	<c:when test="${list eq 'rated'}">
      		 <jsp:include page="list/ratedList.jsp" />
      	</c:when>
      	<c:when test="${list eq 'reviewed'}">
      		<jsp:include page="list/reviewedList.jsp" />
      	</c:when>
      	<c:when test="${list eq 'main'}">
      		 <jsp:include page="list/main.jsp" /> 
      	</c:when>
      	<c:otherwise>
      		??
      	</c:otherwise>
      </c:choose>
    
