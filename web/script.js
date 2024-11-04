function togglePwVisibility() {
  let field = document.getElementById("password");
  if (field.type === "password") {
    field.type = "text";
  } else {
    field.type = "password";
  }
  //TODO itt hagytam abba
}

function checkUsername(username, callback) {
  let url = `api/username_exists.php?user=${username}`;
  return $.ajax({
    type: "GET",
    url: url,
    success: function(data) {
		console.log(data);
		if(eval(`data.${username}`) == 1) {
			console.log("letezik");
		} else {
			console.log("nope");
		}
    },
  });
}
function addNewUser(){
	let username = $("#username").val();
	let password = $("#password").val();
	//TODO hash password
	alert(password);
	let url = `api/register_user.php?username=${username}&password=${password}`;
	return $.post("api/register_user.php", {
		username : username,
		password : password
	});
}

$(document).ready(function () {
  $('#username').keyup(function () {
    checkUsername($(this).val());
  });
});
