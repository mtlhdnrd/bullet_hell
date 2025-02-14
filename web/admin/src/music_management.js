function LoadMusicTable() {
    $.ajax({
        type: "GET",
        url: "./api/admin_get_music_data.php",
        dataType: "json",
        success: function (data, textStatus, xhr) {
            let tableContents = "";
            $.each(data, function (index, music) {
                let musicData = `
                    <tr>
                        <td>${music.name}</td>
                        <td>${music.description}</td>
                        <td><i class="fa-solid fa-trash delete-btn" id=${music.id}></i></td>
                    </tr>
                    `;
                tableContents += musicData;
            });
            $(".table-contents").html(tableContents);
            $(".delete-btn").click(function () {
                ConfirmDelete($(this).attr("id"));
            });
        },
    });
}

function ConfirmDelete(id) {
    if (confirm("Are you sure you want to delete the music pack?")) {
        DeleteMusic(id);
    }
}

function DeleteMusic(id) {
    $.ajax({
        type: "DELETE",
        url: "./api/admin_delete_music.php",
        data: { id: id },
        success: function (data, textStatus, xhr) {
            switch (xhr.status) {
                case 200:
                    LoadMusicTable();
                    break;
            }
        },
    });
}

$(document).ready(function () {
    LoadMusicTable();
    $("#music-pack-form").submit(function (event) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "./api/admin_add_new_music.php",
            data: $(this).serialize(),
            success: function (data, textStatus, xhr) {
                alert("New music added!");
                LoadMusicTable();
            },
            error: function (xhr, status, error) {
                console.error(error);
            },
        });
    });
});
