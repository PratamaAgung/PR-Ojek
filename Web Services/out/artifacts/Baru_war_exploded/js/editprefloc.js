function editLocation(id_location, id_active) {
    if(document.getElementById('loc'+id_location).disabled) {
        document.getElementById('loc' + id_location).disabled = false;
        document.getElementById('loc' + id_location).focus();
        document.getElementById('edit' + id_location).innerHTML = "&#10004;";
        document.getElementById('edit' + id_location).style.color = "green";
        document.getElementById('delete' + id_location).setAttribute("onClick", "deleteLocation(" + id_active + ")");
    }
    else {
        document.getElementById('loc' + id_location).disabled = true;
        document.getElementById('edit' + id_location).innerHTML = "&#10000;";
        document.getElementById('delete' + id_location).setAttribute("onClick", "resetLocation()");

        var new_location = document.getElementById('loc' + id_location).value;
        var locUpdate = "testbackend/updateLocation.php?id_location=" + id_location + "&new_location=" + new_location;

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                if (this.responseText === "1") {
                    location.reload();
                }
                else {
                    console.log("gagal update");
                }
            }
        };
        xmlhttp.open("GET", locUpdate, true);
        xmlhttp.send();
    }
}

function deleteLocation(id_location, id_active) {
    var locDelete = "testbackend/deleteLocation.php?id_location=" + id_location;

    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText === "1") {
                location.reload();
            }
            else {
                console.log("gagal delete");
            }
        }
    };
    xmlhttp.open("GET", locDelete, true);
    xmlhttp.send();
}

function addLocation(id_active) {
    var location = document.getElementById('location').value;
    var locAdd = "testbackend/addLocation.php?id_active=" + id_active + "&location=" + location;

    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if (this.response === "1") {
                window.location.reload();
            }
            else {
                console.log("gagal add");
            }
        }
    };
    xmlhttp.open("GET", locAdd, true);
    xmlhttp.send();
}

function resetLocation() {
    location.reload();
    console.log("reset");
}