<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   <nav>
      <div id="left">
        <div id="logo"><a href="/home">TMDB</a></div>
        <div class="leftMenu">
        	<div class="dropdown menu">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			영화
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				    <li><a class="dropdown-item" href="/movie/popular">인기</a></li>
				    <li><a class="dropdown-item" href="/movie/now-playing">상영중</a></li>
				    <li><a class="dropdown-item" href="/movie/up-coming">개봉 예정</a></li>
				    <li><a class="dropdown-item" href="/movie/rating">평점순</a></li>
  				</ul>
			</div>
			<div class="dropdown menu">
  				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			TV
  				</button>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				    <li><a class="dropdown-item" href="/tv/netflix">넷플릭</a></li>
				    <li><a class="dropdown-item" href="/tv/amazon">아마존</a></li>
				    <li><a class="dropdown-item" href="/tv/watcha">왓챠</a></li>
				    <li><a class="dropdown-item" href="/tv/waave">웨이브</a></li>
  				</ul>
			</div>
          
          <div class="menu">게시판(드랍다운)</div>
        </div>
      </div>
      <div id="right">
        <div class="rightMenu">
       
       	<sec:authorize access="isAuthenticated()" >
       	 <sec:authentication property="principal.uvo.email" var="authEmail" />
	          <sec:authentication property="principal.uvo.nickName" var="authNick" />
	          <sec:authentication property="principal.uvo.authList" var="auths" />
       		<div class="menu">
       			<form action="/user/logout" method="post">
       				<input type="hidden" value="${authEmail }">
       				<button class="nav-btn" type="submit">Log Out</button>
       			</form>
       			
       		</div>
          	<div class="menu">
          	<form action="/user/detail" id="myPageForm">
          		<input type="hidden" name="email" value="${authEmail }">
          	<button class="nav-btn" type="submit">${authNick }(${authEmail })</button>
          	</form>
          	</div>
       	</sec:authorize>
       	<sec:authorize access="isAnonymous()">
          <div class="menu"><a href="/user/login">Login</a></div>
          <div class="menu"><a href="/user/register">Sign in</a></div>
       	</sec:authorize>
        </div>
      </div>
    </nav>