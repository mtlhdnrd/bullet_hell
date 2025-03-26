var sort_criterion = sessionStorage.getItem("sort_criterion");
if(sort_criterion == null) {
    sort_criterion = "username";
    sessionStorage.setItem("sort_criterion", sort_criterion);
}

var sort_asc = sessionStorage.getItem("sort_asc");
if(sort_asc == null) {
    sort_asc = "true";
    sessionStorage.setItem("sort_asc", sort_asc);
}

function LoadUserTable() {
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
    var data_loaded = false;
    $.ajax({
        type: "GET",
        url: `./api/admin_get_user_data.php?p=${page}&sort_criterion=${sort_criterion}&sort_asc=${sort_asc}`,
        dataType: "json",
        success: function (data, textStatus, xhr) {
            let tableContents = "";
            $.each(data, function (index, user) {
                if(user.winrate == null) {
                    user.winrate = 0;
                }
                let playerData = `
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.points}</td>
                        <td>${parseFloat(user.winrate)}</td>
                        <td>${user.all_games_played}</td>
                        <td>${user.kills}</td>
                        <td>${user.deaths}</td>
                        <td><i class="fa-solid fa-trash delete-btn" id=${user.username}></i></td>
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
            $(".delete-btn").click(function () {
                ConfirmDelete($(this).attr("id"));
            });
            data_loaded = true;
        },
    });
    setTimeout(function() {
        if(!data_loaded) {
            $(".table-contents").html('<tr><td colspan="7">Loading...</td></tr>');
        }
    }, 250);
}

function ConfirmDelete(username) {
    if (confirm("Are you sure you want to delete this user: " + username)) {
        DeleteUser(username);
    }
}
function DeleteUser(username) {
    $.ajax({
        type: "DELETE",
        url: "./api/admin_delete_user.php",
        data: { username: username },
        success: function (data, textStatus, xhr) {
            switch (xhr.status) {
                case 200:
                    LoadUserTable(false);
                    break;
            }
        },
    });
}

$(document).ready(function () {
    if(sort_asc == "true") {
        $(`#${sort_criterion}`).children("span").html("🞁");
    } else {
        $(`#${sort_criterion}`).children("span").html("🞃");
    }
    $("#page_size").change(function () {
        $.ajax({
            type: "POST",
            url: "../src/php/set_page_size.php",
            data: { size: $("#page_size").val() },
            success: function (data, textStatus, xhr) {
                switch (xhr.status) {
                    case 200:
                        $(".table-contents").html("");
                        LoadUserTable(true);
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

    LoadUserTable(true);

    $("#username, #points, #winrate, #all_games_played, #kills, #deaths").click(function() {
        if(sort_criterion == $(this).attr("id")) {
            sort_asc = !sort_asc;
        } else {
            sort_criterion = $(this).attr("id");
            sort_asc = true;
            sessionStorage.setItem("sort_criterion", sort_criterion);
        }
        sessionStorage.setItem("sort_asc", sort_asc);
        $(".clickable_head").children("span").html("");
        if(sort_asc) {
            $(this).children("span").html("🞁");
        } else {
            $(this).children("span").html("🞃");
        }
        LoadUserTable(false);
    });
});
