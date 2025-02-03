function LoadUserTable(){
    $.ajax({
        type: "GET",
        url: "admin_get_user_data.php",
        dataType: "json",
        success: function(data, textStatus, xhr)
        {
            let tableContents = "";
            $.each(data, function(index, user){
                let playerData = `
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.points}</td>
                            <td>${user.winrate}</td>
                            <td>${user.all_games_played}</td>
                            <td>${user.kills}</td>
                            <td>${user.deaths}</td>
                            <td><i class="fa-solid fa-trash delete-btn" id=${user.username}></i><td>
                        </tr>
                    `;
                    tableContents+=playerData;
            });
            $('.table-contents').html(tableContents);
            $('.delete-btn').click(function(){
                ConfirmDelete($(this).attr("id"));
            });
        }
    });
}

function ConfirmDelete(username) {
    if (confirm("Are you sure you want to delete this user: "+username)) {
      DeleteUser(username);
    }
}
function DeleteUser(username){
    $.ajax({
        type: "DELETE",
        url: "admin_delete_user.php",
        data: {username:username},
        success: function(data, textStatus, xhr){
            switch(xhr.status)
            {
                case 200:
                    LoadUserTable();
                    break;
            }
        }
    });
}

$(document).ready(function(){
    LoadUserTable();
});