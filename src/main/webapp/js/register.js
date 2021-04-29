//$(function () {
//    $("#btnSubmit").click(function () {
//        var password = $("#password").val();
//        var confirmPassword = $("#repassword").val();
//        if (password !== confirmPassword) {
//            alert("Passwords do not match.");
//            return false;
//        }
//        return true;
//    });
//});

function submitForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("repassword").value;
    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }
    return true;
}