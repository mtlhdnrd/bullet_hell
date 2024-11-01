function togglePwVisibility(){
    let field = document.getElementById("password");
    if(field.type==="password"){
        field.type = "text";
    }else{
        field.type = "password";
    }
    //TODO itt hagytam abba
}

function checkUsername(username, callback) {
  let url = `api/username_exists.php?user=${username}`;
  return $.ajax({
    type: "GET",
    url: `api/username_exists.php?user=${username}`,
    dataType: "json"
  });
}

}
$(document).ready(function() {
    $('#username').keypress(function() {
        checkUsername($(this).value)
  .then(function(data) {
    console.log(data);
    // Process the data here
  })
  .catch(function(error) {
    console.error(error);
  });
    });
});
