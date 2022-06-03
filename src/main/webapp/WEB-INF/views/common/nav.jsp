<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   <nav class="navbar navbar-expand-lg">
      <div class="container-fluid" >
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarTogglerDemo01"
          aria-controls="navbarTogglerDemo01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon">=</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01" style="height:60px;">
          <a id="logo" class="navbar-brand" href="/">MovieDB</a>
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle menu"
                href="#"
                id="navbarScrollingDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                영화
              </a>
              <ul
                class="dropdown-menu"
                aria-labelledby="navbarScrollingDropdown"
              >
                <li><a class="dropdown-item" href="/movie/popular">인기순</a></li>
                <li><a class="dropdown-item" href="/movie/now-playing">상영중</a></li>
                <li><a class="dropdown-item" href="/movie/up-coming">개봉 예정</a></li>
                <li><a class="dropdown-item" href="/movie/rating">평점순</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle menu"
                href="#"
                id="navbarScrollingDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                TV
              </a>
              <ul
                class="dropdown-menu"
                aria-labelledby="navbarScrollingDropdown"
              >
                <li><a class="dropdown-item" href="/tv/netflix">넷플릭스</a></li>
                <li><a class="dropdown-item" href="/tv/amazone">아마존</a></li>
                <li><a class="dropdown-item" href="/tv/watcha">왓챠</a></li>
                <li><a class="dropdown-item" href="/tv/waave">웨이브</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link menu" href="/user/userRank?query=reg_at">랭킹</a>
            </li>
            <li class="nav-item">
              <a class="nav-link menu" href="/purchase/font">Shop</a>
            </li>
          </ul>
          <ul class="navbar-nav d-flex" role="search">

				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.uvo.email" var="authEmail" />
					<sec:authentication property="principal.uvo.nickName"
						var="authNick" />
					<sec:authentication property="principal.uvo.authList" var="auths" />
					<c:if
						test="${ auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
						<li class="nav-item"><a class="nav-link menu" href="/user/userList">user-list</a>
						</li>
					</c:if>
					<li class="nav-item">
						<form action="/user/logout" id="logoutForm" method="post">
		       				<input type="hidden" value="${authEmail }">
		       				<a class="nav-link menu" id="logOutBtn" type="submit">Log Out</a>
		       			</form>
					</li>
					<li class="nav-item"><a class="nav-link menu" href="/user/${authEmail }">${authNick }(${authEmail })</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link menu" href="/user/login">log-in</a></li>
					<li class="nav-item"><a class="nav-link menu" href="/user/register">sign-up</a></li>
				</sec:authorize>
			</ul>
        </div>
      </div>
      <script>
	      const handleSubmit = () => { 
	    	  document.getElementById("logoutForm").submit();
	    	};

    	document.getElementById("logOutBtn").addEventListener("click", handleSubmit);
      </script>
    </nav>