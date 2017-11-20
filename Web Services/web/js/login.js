document.getElementById('error-password').style.display = "none";

function login() {
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText !== "0") {
                location.href = "profile.php?id_active="+this.responseText;
            }
            else {
                document.getElementById('error-password').style.display = "block";
            }
        }
    };
    xmlhttp.open("POST", "testbackend/checkLogin.php", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("username="+username+"&password="+password);
}