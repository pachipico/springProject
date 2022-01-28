<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />

<jsp:include page="../common/nav.jsp" />
    <form action="/user/register" method="post" class="row g-3">
      <div class="col-md-6">
        <label for="inputEmail4" class="form-label">Email</label>
        <input type="email" class="form-control" name="email" id="inputEmail4" />
      </div>
      <div class="col-md-6">
        <label for="inputPassword4" class="form-label">Password</label>
        <input type="password" class="form-control" name="pwd" id="inputPassword4" />
      </div>
      <div class="col-md-6">
        <label for="inputAddress" class="form-label"> Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="" />
      </div>
      <div class="col-md-6">
        <label for="inputAddress2" class="form-label">Nick Name</label>
        <input type="text" class="form-control" id="nickName" name="nickName" />
      </div>

      <div class="col-12">
        <button type="submit" class="btn btn-primary">Sign in</button>
      </div>
    </form>
  </body>
</html>
