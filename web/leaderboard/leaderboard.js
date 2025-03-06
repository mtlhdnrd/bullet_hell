class Player {
    constructor(
        rank,
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
        this.rank = rank;
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
    var number_of_pages = 1;
    $.ajax({
        type: "GET",
        url: "get_number_of_pages.php",
        async: false,
        success: function (data, textStatus, xhr) {
            number_of_pages = Number(data)
            if(isNaN(number_of_pages) || number_of_pages < 1) {
                number_of_pages = 1;
            }
        }
    });
    var page = Number(GetUrlParameter("p"));
    if(isNaN(page) || page < 1 || page > number_of_pages) {
        window.location.search = "p=1";
    }
    $.ajax({
        type: "GET",
        url: `get_leaderboard_data.php?p=${page}`,
        success: function (data, textStatus, xhr) {
            $.each(data, function (index, player) {
                leaderboard.push(
                    new Player(
                        player.rank,
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
            let placementDesign, rowBg;
            switch(player.rank)
            {
                case 1:
                    placementDesign = "first-place-row";
                    break;
                case 2:
                    placementDesign = "second-place-row";
                    break;
                case 3: 
                    placementDesign = "third-place-row";
                    break;
                default:
                    placementDesign = "";
                    break;
            }
            console.log(placementDesign);
            let playerData = `<tr>
                    <td class="${placementDesign}">${player.rank}</td>
                    <td class="${placementDesign}">${player.username}</td>
                    <td class="${placementDesign}"></td>
                    <td class="${placementDesign}">${player.points}</td>
                    <td class="${placementDesign}">${player.winrate}</td>
                    <td class="${placementDesign}">${player.all_games_played}</td>
                    <td class="${placementDesign}">${player.kills}</td>
                    <td class="${placementDesign}">${player.deaths}</td>
                </tr>
                `;
            tableContents += playerData;
        });
        $(".table-contents").html(tableContents);

        var pagecontrols = "";
        var previous_page = null;
        if(page != 1) {
            previous_page = page - 1;
        }
        var next_page = null;
        if(page < number_of_pages) {
            next_page = page + 1;
        }

        if(previous_page != null) {
            pagecontrols += `<a class="h-100 text-decoration-none" href="${window.location.pathname}?p=${previous_page}">
                <img src="../src/images/ui/carousel-prev-icon.png" alt="" class="img-fluid anti-alias">
            </a>`
        }
        if(next_page != null) {
            pagecontrols += `<a class="h-100 text-decoration-none" href="${window.location.pathname}?p=${next_page}">
                <img src="../src/images/ui/carousel-next-icon.png" alt="" class="img-fluid anti-alias">
            </a>`
        }
        $("#page-controls").html(pagecontrols);
    });
}

// credit: https://stackoverflow.com/questions/19491336/how-to-get-url-parameter-using-jquery-or-plain-javascript
function GetUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
}
