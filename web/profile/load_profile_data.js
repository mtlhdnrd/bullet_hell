function LoadUserData(username) {
    let ret;
    $.ajax({
        type: "GET",
        url: "get_user_statistics.php",
        data: { username: username },
        success: function (data, textStatus, xhr) {
            $("#stat-points").text(data[0].points);
            $("#stat-winrate").text(`${parseFloat(data[0].winrate).toFixed(1)}%`);
            $("#stat-gamesplayed").text(data[0].all_games_played);
            $("#stat-kills").text(data[0].kills);
            $("#stat-deaths").text(data[0].deaths);
            $("#stat-music").text(data[0].music_pack == null ? "No Music" : data[0].music_pack);
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
