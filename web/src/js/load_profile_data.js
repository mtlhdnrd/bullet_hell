function GetUserData(username) {
    let ret;
    $.ajax({
        type: "GET",
        url: "../src/php/get_user_statistics.php",
        data: { username: username },
        success: function (data, textStatus, xhr) {
            let json = $.parseJSON(data);
            $("#stat-points").text(json[0].points);
            $("#stat-winrate").text(json[0].winrate);
            $("#stat-gamesplayed").text(json[0].all_games_played);
            $("#stat-kills").text(json[0].kills);
            $("#stat-deaths").text(json[0].deaths);
            $("#stat-music").text(json[0].name);
        },
    });
    return ret;
}
addEventListener("load", (event) => {
    let userData = GetUserData($("#username").text());
});
