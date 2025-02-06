class Player {
    constructor(
        username,
        points,
        winrate,
        all_games_played,
        kills,
        deaths,
        most_used_music_id,
        current_music_id,
        active_skin_id
    ) {
        this.username = username;
        this.points = points;
        this.winrate = winrate;
        this.all_games_played = all_games_played;
        this.kills = kills;
        this.deaths = deaths;
        this.most_used_music_id = most_used_music_id;
        this.current_music_id = current_music_id;
        this.active_skin_id = active_skin_id;
    }

    DebugInfo() {
        return `Player: ${this.username}
            Points: ${this.points}
            Winrate: ${this.winrate}%
            Games Played: ${this.all_games_played}
            Kills: ${this.kills}
            Deaths: ${this.deaths}
            Most Used Music ID: ${this.most_used_music_id}
            Current Music ID: ${this.current_music_id}
            Active Skin ID: ${this.active_skin_id}`;
    }
}

leaderboard = [];

$(document).ready(function () {
    GetLeaderboardData();
});

function GetLeaderboardData() {
    $.ajax({
        type: "GET",
        url: "get_leaderboard_data.php",
        success: function (data, textStatus, xhr) {
            $.each(data, function (index, player) {
                leaderboard.push(
                    new Player(
                        player.username,
                        player.points,
                        player.winrate,
                        player.all_games_played,
                        player.kills,
                        player.deaths,
                        player.most_used_music_id,
                        player.current_music_id,
                        player.active_skin_id
                    )
                );
            });
        },
    }).then((result) => {
        let tableContents = "";
        leaderboard.forEach((player) => {
            let playerData = `<tr>
                    <td>${player.username}</td>
                    <td>${player.points}</td>
                    <td>${player.winrate}</td>
                    <td>${player.all_games_played}</td>
                    <td>${player.kills}</td>
                    <td>${player.deaths}</td>
                </tr>
                `;
            tableContents += playerData;
        });
        $(".table-contents").html(tableContents);
    });
}
