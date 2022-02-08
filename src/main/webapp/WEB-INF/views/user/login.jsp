<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />

<jsp:include page="../common/nav.jsp" />
    <main class="form-signin">
      <form action="/user/login" method="post">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

        <div class="form-floating">
          <input
            type="email"
            name="email"
            class="form-control"
            id="floatingInput"
            placeholder="name@example.com"
          />
          <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating">
          <input
            type="password"
            name="pwd"
            class="form-control"
            id="floatingPassword"
            placeholder="Password"
          />
          <label for="floatingPassword">Password</label>
        </div>

        <a href="/user/findId">아이디를 잊어버리셨나요?</a>
        <a href="/user/findPwd">비밀번호 찾기</a>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
      </form>
    </main>
  </body>
  <script>
  let isUp = `<c:out value="${isUp}" />`;
	if(isUp > 0){
		alert("정보 수정 완료");
	}
  </script>
</html>

