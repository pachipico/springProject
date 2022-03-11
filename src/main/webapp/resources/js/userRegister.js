let emailChecked = false;
let nickNameChecked = false;
let emailInput = document.getElementById("email");
let nickNameInput = document.getElementById("nickName");
const validEmailChk = async () => {
  try {
    const email = emailInput.value;
    const config = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email }),
    };
    const res = await fetch(`/user/email`, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};

const validNickNameChk = async () => {
  try {
    const nickName = nickNameInput.value;
    const config = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ nickName }),
    };
    const res = await fetch(`/user/nickName`, config);
    const result = await res.text();
    return result;
  } catch (e) {
    console.log(e);
  }
};
function email_check(email) {
  var regex =
    /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  return email != "" && email != "undefined" && regex.test(email);
}
document.getElementById("validEmailChk").addEventListener("click", (e) => {
  if (emailInput.value.trim() == "") {
    alert("이메일을 입력해주세요!");
    emailInput.focus();
    return;
  } else if (!email_check(emailInput.value)) {
    alert("올바른 이메일 형식이 아닙니다.");
    emailInput.value = "";
    emailInput.focus();
    return;
  }
  validEmailChk().then((result) => {
    if (parseInt(result) > 0) {
      alert("사용 가능한 이메일 입니다.");
      emailInput.readOnly = true;
      emailChecked = true;
    } else {
      alert("이미 사용중인 이메일 입니다.");
      emailInput.value = "";
      emailInput.focus();
    }
  });
});

document.getElementById("validNickNameChk").addEventListener("click", (e) => {
  if (nickNameInput.value.trim() == "") {
    alert("닉네임을 입력해주세요!");
    return;
  }

  validNickNameChk().then((result) => {
    if (parseInt(result) > 0) {
      alert("사용 가능한 닉네임 입니다.");
      nickNameInput.readOnly = true;
      nickNameChecked = true;
    } else {
      alert("이미 사용중인 닉네임 입니다.");
      nickNameInput.value = "";
      nickNameInput.focus();
    }
  });
});

document.getElementById("regBtn").addEventListener("click", (e) => {
  if (!emailChecked) {
    alert("이메일 중복체크를 해주세요.");
  } else if (!nickNameChecked) {
    alert("닉네임 중복체크를 해주세요.");
  } else if (document.getElementById("pwd").value != document.getElementById("pwdChk").value) {
    alert("비밀번호가 일치하지 않습니다.");
  } else {
    document.getElementById("registerForm").submit();
  }
});
