var step = 1;

function check(step) {
    if(step == 1){
        document.getElementById('step-1').style.display='block';
        document.getElementById('step-2').style.display='none';
        document.getElementById('step-3').style.display='none'
    }else{
        if (step == 2 && checkLocation()){
            document.getElementById('step-1').style.display='none';
            document.getElementById('step-2').style.display='block';
            document.getElementById('step-3').style.display='none';
            document.getElementById("label-step-1").classList.remove('order-step-now');
            document.getElementById("label-step-1").classList.add('order-step');
            document.getElementById("label-step-2").classList.remove('order-step');
            document.getElementById("label-step-2").classList.add('order-step-now');
        } else if (step == 3){
            document.getElementById('step-1').style.display='none';
            document.getElementById('step-2').style.display='none';
            document.getElementById('step-3').style.display='block';
            document.getElementById("label-step-2").classList.remove('order-step-now');
            document.getElementById("label-step-2").classList.add('order-step');
            document.getElementById("label-step-3").classList.remove('order-step');
            document.getElementById("label-step-3").classList.add('order-step-now');
        }
    }
}

function checkLocation() {
    if(document.getElementById('destination').value != "" && document.getElementById('pick-location').value != "") {
        return true;
    }else {
        alert("Isi destination dan pick location");
        step--;
        return false;
    }
}

function increase() {
    step++;
    check(step);
}

check(step);

function setPreferDriver(search,id,destination,pick){
    if(search != ""){
        console.log(search);
        var xmlhttp;
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                if(this.response == -1){
                    document.getElementById("preffered-driver").innerHTML = "<div class='head-title driver-list content-font-segoe'> <p class='posisi-tengah'>Nothing to Display :(</p></div>"
                } else {
                    document.getElementById("preffered-driver").innerHTML = this.response;
                }
            }
        };
        xmlhttp.open("GET", "jsp/getpreferreddriver.jsp?search=" + search + "&username="+ id +"&destination="+destination+"&pick="+pick, true);
        xmlhttp.send();
    } else {
        document.getElementById("preffered-driver").innerHTML = "<div class='head-title driver-list content-font-segoe'> <p class='posisi-tengah'>Nothing to Display :(</p></div>"
    }
}

function setOtherDriver(search,id,destination,pick){
        var xmlhttp;
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                if(this.response == -1){
                    document.getElementById("other-driver").innerHTML = "<div class='head-title driver-list content-font-segoe'> <p class='posisi-tengah'>Nothing to Display :(</p></div>"
                } else {
                    document.getElementById("other-driver").innerHTML = this.response;
                }
            }
        };
        xmlhttp.open("GET", "jsp/getotherdriver.jsp?search=" + search + "&username="+ id +"&destination="+destination+"&pick="+pick, true);
        xmlhttp.send();
}

function iChoose(id_driver) {
    document.getElementById("driver-id").value = id_driver;
    // console.log(id_driver);
    var xmlhttp;
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    // console.log("masuk");
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // console.log("response" + this.responseText);
            if(this.response == -1){
                console.log("aneh");
            }else {
                document.getElementById("info-selected-driver").innerHTML = this.response
            }
        }
    };
    xmlhttp.open("GET", "jsp/getpreferreddriver.jsp?get_info=" + id_driver, true);
    xmlhttp.send();
}
