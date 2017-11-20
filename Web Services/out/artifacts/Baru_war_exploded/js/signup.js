var isEmailExisting = 0;

function checkUsername(username) {
    if (username.length == 0) {
        document.getElementById("checkUsername").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("checkUsername").innerHTML = this.response;
                if (this.responseText === "1") {
                    document.getElementById("checkUsername").innerHTML = "<span style='color: green' >&#10004;</span>";
                }
                else {
                    document.getElementById("checkUsername").innerHTML = "<span style='color: red' >&#10008;</span>";
                }
            }
        };
        xmlhttp.open("GET", "testbackend/checkUsername.php?username=" + username, true);
        xmlhttp.send();
    }
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if(!re.test(email)){
        document.getElementById("error-email").style.display = "block";
        return false;
    }
    else {
        document.getElementById("error-email").style.display = "none";
        return true;
    }
}

function checkEmail(email) {

    if (email.length == 0) {
        document.getElementById("checkEmail").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("checkEmail").innerHTML = this.response;
                if (this.responseText === "1") {
                    document.getElementById("checkEmail").innerHTML = "<span style='color: green' >&#10004;</span>"

                    isEmailExisting = 0;
                }
                else {
                    document.getElementById("checkEmail").innerHTML = "<span style='color: red' >&#10008;</span>"
                    // return false;
                    isEmailExisting = 1;
                }
            }
        };
        xmlhttp.open("GET", "testbackend/checkEmail.php?email=" + email, true);
        xmlhttp.send();
    }

    validateEmail(email);
}

function checkName(name) {
    if (name.length > 20) {
        document.getElementById("error-name").style.display = "block";
        return false;
    } else {
        document.getElementById("error-name").style.display = "none";
        return true;
    }
}

function checkPassword(password){
    if (password != document.getElementById("user-password").value) {
        document.getElementById("error-password").style.display = "block";
        return false;
    } else {
        document.getElementById("error-password").style.display = "none";
        return true;
    }
}

function checkPhoneNumber(phone_number) {
    var isnum = /^\d+$/.test(phone_number);

    if ((phone_number.length < 9) || (phone_number.length > 14) || !isnum) {
        document.getElementById("error-phone-number").style.display = "block";
        return false;
    } else {
        document.getElementById("error-phone-number").style.display = "none";
        return true;
    }
}

function submitSignUp() {
    console.log("submit");
    var full_name = document.getElementById("full_name").value;
    var username = document.getElementById("username").value;
    var email = document.getElementById("user_email").value;
    var password = document.getElementById("user-password").value;
    var phone_number = document.getElementById("user-phone-number").value;
    if(document.getElementById("driverstatus").checked){
        var statusdriver = 1;
    }
    else {
        var statusdriver = 0;
    }

    if (checkPhoneNumber(phone_number) && checkPassword(password) && checkName(full_name) &&
        (isEmailExisting == 0) && validateEmail(email)) {
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
                    var obj = JSON.parse(this.response);
                    if(obj.driver === "1") {
                        location.href = "profile.php?id_active="+obj.id_user;
                    }
                    else {
                        location.href = "makeorder.php?id_active="+obj.id_user;
                    }
                }
                else {

                }
            }
        };
        xmlhttp.open("POST", "testbackend/addUser.php", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("full_name="+full_name+"&username="+username+"&email="+email+
            "&password="+password+"&phone_number="+phone_number+"&statusdriver="+statusdriver);
    }
}