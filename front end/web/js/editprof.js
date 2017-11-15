    var getUser = "jsp/getUserDetail.jsp?token=";

    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var obj = JSON.parse(this.response);
            console.log(obj);
            document.getElementById('name').value = obj.name;
            document.getElementById('phone').value = obj.phone_number;

            if(obj.driver === "1"){
                document.getElementById('statusDriver').checked = true;
            }

            document.getElementById('img-profile').setAttribute('src', obj.image_address);
        }
    };
    xmlhttp.open("GET", getUser, true);
    xmlhttp.send();


function cek(yey) {
    var path  = document.getElementById('file-upload').value;
    var filename = path.replace(/^.*[\\\/]/, '')
    document.getElementById('file-path').value = filename;

function stats() {
    console.log(document.getElementsByName('driver_status'));
}