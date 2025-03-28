function LoadCharacterTable() {
    $.ajax({
        type: "GET",
        url: "./api/admin_get_character_data.php",
        dataType: "json",
        success: function (data, textStatus, xhr) {
            let tableContents = "";
            $.each(data, function (index, character) {
                let characterData = `
                    <tr>
                        <td>${character.name}</td>
                        <td>${character.description}</td>
                        <td><i class="fa-solid fa-trash delete-btn" id=${character.id}></i></td>
                    </tr>
                    `;
                tableContents += characterData;
            });
            $(".table-contents").html(tableContents);
            $(".delete-btn").click(function () {
                ConfirmDelete($(this).attr("id"));
            });
        },
    });
}

function ConfirmDelete(id) {
    if (confirm("Are you sure you want to delete the character?")) {
        DeleteCharacter(id);
    }
}

function DeleteCharacter(id) {
    $.ajax({
        type: "DELETE",
        url: "./api/admin_delete_character.php",
        data: { id: id },
        success: function (data, textStatus, xhr) {
            switch (xhr.status) {
                case 200:
                    LoadCharacterTable();
                    break;
            }
        },
    });
}

$(document).ready(function () {
    LoadCharacterTable();
    $("#character-form").submit(function (event) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "./api/admin_add_new_character.php",
            data: $(this).serialize(),
            success: function (data, textStatus, xhr) {
                LoadCharacterTable();
            },
            error: function (xhr, status, error) {
                console.error(error);
            },
        });
    });
});
