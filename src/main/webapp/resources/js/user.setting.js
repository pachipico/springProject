document.addEventListener("click", (e) => {
  if (e.target.id == "profileImgSubmitBtn") {
    document.getElementById("profileImgForm").submit();
  } else if (e.target.id == "changeEmailSubmitBtn") {
    console.log("?");
    const nickName = document.getElementById("nickName").value;
    const newNickName = document.getElementById("nickNameMatch").value;
    if (nickName == newNickName) {
      document.getElementById("changeNickNameForm").submit();
    } else {
      alert("닉네임이 일치하지 않습니다.");
      nickName.focus();
    }
  } else if (e.target.id == "changePwdSubmitBtn") {
    const newPwd = document.getElementById("newPwd").value;
    const pwdChk = document.getElementById("pwdChk").value;
    console.log(newPwd, pwdChk);
    if (newPwd == pwdChk) {
      document.getElementById("changePwdForm").submit();
    }
  }
});
