document.querySelector("#btn").addEventListener("click", () => {
    const loginid = "admin";
    const loginpass = "1234";
 
    if(loginid == document.querySelector("#loginid").value) {
        if(loginpass == document.querySelector("#loginpass").value) {
            alert("환영합니다!");
            setTimeout(function(){ window.location.replace('main.html')}, 1);
        }
        else {
            alert("비밀번호가 맞지 않습니다.");
        }
    }
    else {
        alert("아이디 혹은 비밀번호가 맞지 않습니다.");
    }
});
