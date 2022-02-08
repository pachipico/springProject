<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/userSetting.css" />


    <div id="emailDiv">
      <div >
      	<img id="profileImg" src="/fileUpload/${uvo.profileImg }">
      </div>
      <span><c:out value="${uvo.nickName }"/></span>
    </div>
    <div id="settingContainer">
      <div id="leftMenu">
        <div id="settingTitle">Setting</div>
        <div class="settingMenu">
          <a href="/user/${uvo.email }/modify" id="currMenu"> 프로필 편집 </a>
        </div>
        <div class="settingMenu">
          <a href="/user/${uvo.email }/setting"> 계정 설정 </a>
        </div>
      </div>
      <div id="settingMain">
        <h4>프로필 편집</h4>
        <div class="setting">
          <a href="#" class="btn btn-secondary">비밀번호 변경</a>
          <a href="#" class="btn btn-secondary">닉네임 변경</a>
        </div>
        <div class="setting">
          <label for="emailInput"><c:out value="${uvo.email }" /></label>
          <input id="emailInput" type="text" class="form-control" readonly value="pachipico1@gmail.com" />
        </div>
        <div class="setting">
          <label for="imgUploadModalBtn">현재 아바타</label>
          <br />
          아바타 없음
          <a id="imgUploadModalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal"
            >아바타를 불러오시겠습니까?</a
          >
        </div>
        <div class="setting">폰트 색 변경 <br />** 추후 추가예정 **</div>
        
      </div>
    </div>
  </body>
  <!-- Modal -->
  <div
    class="modal fade"
    id="exampleModal"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">아바타 추가</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="/user/modify/profileImg" id="profileImgForm" method="post" enctype="multipart/form-data">
          	<input type="hidden" name="email" value="${uvo.email }">
            <input type="file" name="file" />
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" id="profileImgSubmitBtn" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>
  <script src="/resources/js/user.setting.js"></script>
</html>


<%-- 
<c:out value="${uvo }" />
<c:out value="${purchased }"></c:out> --%>