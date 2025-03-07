function LoadUserData(username) {
    let ret;
    $.ajax({
        type: "GET",
        url: "get_user_statistics.php",
        data: { username: username },
        success: function (data, textStatus, xhr) {
            let json = $.parseJSON(data);
            console.log(data);
            $("#stat-points").text(json[0].points);
            $("#stat-winrate").text(json[0].winrate);
            $("#stat-gamesplayed").text(json[0].all_games_played);
            $("#stat-kills").text(json[0].kills);
            $("#stat-deaths").text(json[0].deaths);
            $("#stat-music").text(json[0].music_pack == null ? "No Music" : json[0].music_pack);
        },
    });
    return ret;
}
async function GetUsername() {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: "../src/php/get_username.php",
            success: function (data, textStatus, xhr) {
                resolve(data);
            },
            error: function (xhr, status, error) {
                console.error(error);
                reject(error);
            },
        });
    });
}
addEventListener("load", async (event) => {
    try {
        const username = await GetUsername();
        LoadUserData(username);
    } catch (error) {
        console.error("Error:", error);
    }
});
