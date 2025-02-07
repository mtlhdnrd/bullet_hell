function LoadMapTable() {
    $.ajax({
        type: "GET",
        url: "admin_get_map_data.php",
        dataType: "json",
        success: function (data, textStatus, xhr) {
            let tableContents = "";
            $.each(data, function (index, map) {
                let mapData = `
                    <tr>
                        <td>${map.name}</td>
                        <td>${map.description}</td>
                        <td>${map.music_pack}</td>
                        <td><i class="fa-solid fa-trash delete-btn" id=${map.id}></i><td>
                    </tr>
                    `;
                tableContents += mapData;
            });
            $(".table-contents").html(tableContents);
            $(".delete-btn").click(function () {
                ConfirmDelete($(this).attr("id"));
            });
        },
    });
}

function ConfirmDelete(id) {
    if (confirm("Are you sure you want to delete the map?")) {
        DeleteMap(id);
    }
}

function DeleteMap(id) {
    $.ajax({
        type: "DELETE",
        url: "admin_delete_map.php",
        data: { id: id },
        success: function (data, textStatus, xhr) {
            switch (xhr.status) {
                case 200:
                    LoadMapTable();
                    break;
            }
        },
    });
}

$(document).ready(function () {
    LoadMapTable();
});
