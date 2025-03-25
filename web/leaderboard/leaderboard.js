class Player {
    constructor(
        rank,
        username,
        points,
        winrate,
        all_games_played,
        kills,
        deaths,
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
        this.current_music_id = current_music_id;
        this.active_skin_id = active_skin_id;
    }
}

leaderboard = [];
$(document).ready(function () {
    $("#page_size").change(function () {
        $.ajax({
            type: "POST",
            url: "../src/php/set_page_size.php",
            data: { size: $("#page_size").val() },
            success: function (data, textStatus, xhr) {
                switch (xhr.status) {
                    case 200:
                        $(".table-contents").html("");
                        leaderboard = [];
                        GetLeaderboardData();
                        break;
                    case 400:
                        console.log("ERROR: couldn't change page size");
                        break;
                }
            },
            error: function (data, textStatus, xhr) {
                console.error(xhr);
            },
        });
    });

    GetLeaderboardData();
});

function GetLeaderboardData() {
    $(".table-contents").html('<tr><td colspan="8">Loading...</td></tr>');
    var current_player = $("#login-username").html().trim();
    var number_of_pages = 1;
    $.ajax({
        type: "GET",
        url: "../src/php/get_number_of_pages.php",
        async: false,
        success: function (data, textStatus, xhr) {
            number_of_pages = Number(data);
            if (isNaN(number_of_pages) || number_of_pages < 1) {
                number_of_pages = 1;
            }
        },
    });
    var page = Number(GetUrlParameter("p"));
    if (isNaN(page) || page < 1 || page > number_of_pages) {
        window.location.search = "p=1";
    }
    $.ajax({
        type: "GET",
        url: `get_leaderboard_data.php?p=${page}`,
        success: function (data, textStatus, xhr) {
            $.each(data, function (index, player) {
                if(player.winrate == null) {
                    player.winrate = 0;
                }
                leaderboard.push(
                    new Player(
                        player.rank,
                        player.username,
                        player.points,
                        player.winrate,
                        player.all_games_played,
                        player.kills,
                        player.deaths,
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
            switch (player.rank) {
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
            let playerData = `<tr`;
            if (player.username.toLowerCase() == current_player.toLowerCase()) {
                playerData += ` class="current-player"`;
            }
            playerData += `>
                    <td class="${placementDesign}">${player.rank}</td>
                    <td class="${placementDesign}">${player.username}</td>
                    <td class="${placementDesign}"></td>
                    <td class="${placementDesign}">${player.points}</td>
                    <td class="${placementDesign}">${parseFloat(player.winrate).toFixed(1)}%</td>
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
        if (page != 1) {
            previous_page = page - 1;
        }
        var next_page = null;
        if (page < number_of_pages) {
            next_page = page + 1;
        }

        pagecontrols += `<a class="h-100 text-decoration-none${previous_page == null ? " disabled" : ""}" href="${window.location.pathname}?p=${previous_page}">
            <img src="../src/images/ui/carousel-prev-icon.png" alt="" class="img-fluid anti-alias">
        </a>`;
        pagecontrols += `<span class="pixel-font">${page}/${number_of_pages}</span>`;
        pagecontrols += `<a class="h-100 text-decoration-none${next_page == null ? " disabled" : ""}" href="${window.location.pathname}?p=${next_page}">
            <img src="../src/images/ui/carousel-next-icon.png" alt="" class="img-fluid anti-alias">
        </a>`;
        $("#page-controls").html(pagecontrols);
    });
}
