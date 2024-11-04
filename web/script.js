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
	let username = document.getElementById('username');
	let password = document.getElementById('password');
	let url = `api/register_user.php?username=${username}&password=${password}`;
	return $.ajax({
		type: "POST",
		url: url,
		success: function(data){
			console.log(data);
		}
	});
}

$(document).ready(function () {
  $('#username').keyup(function () {
    checkUsername($(this).val());
  });
});
