function LoadWeaponTable() {
    $.ajax({
        type: "GET",
        url: "./api/admin_get_weapon_data.php",
        dataType: "json",
        success: function (data, textStatus, xhr) {
            let tableContents = "";
            $.each(data, function (index, weapon) {
                let weaponData = `
                <tr>
                <td>${weapon.id}</td>
                <td>${weapon.name}</td>
                <td>${weapon.file_name}</td>
                <td>${weapon.damage}</td>
                <td>${weapon.fire_rate}</td>
                <td>${weapon.semi_auto}</td>
                <td>${weapon.rarity}</td>
                <td>${weapon.projectile_speed}</td>
                <td>${weapon.mag}</td>
                <td>${weapon.description}</td>
                <td>${weapon.devinfo}</td>
                <td><i class="fa-solid fa-trash delete-btn" id=${weapon.id}></i></td>
            </tr>
                `;
                tableContents += weaponData;
            });
            $(".table-contents").html(tableContents);
            $(".delete-btn").click(function () {
                ConfirmDelete($(this).attr("id"));
            });
        },
    });
}

function ConfirmDelete(id) {
    if (confirm("Are you sure you want to delete the weapon?")) {
        DeleteWeapon(id);
    }
}

function DeleteWeapon(id) {
    $.ajax({
        type: "DELETE",
        url: "./api/admin_delete_weapon.php",
        data: { id: id },
        success: function (data, textStatus, xhr) {
            switch (xhr.status) {
                case 200:
                    console.log("Weapon removed successfully");
                    LoadWeaponTable();
                    break;
            }
        },
    });
}
$(document).ready(function () {
    LoadWeaponTable();
    $("#weapon-form").submit(function (event) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "./api/admin_add_new_weapon.php",
            data: $(this).serialize(),
            success: function (data, textStatus, xhr) {
                alert("Weapon addedd successfully!");
                LoadWeaponTable();
            },
            error: function (xhr, status, error) {
                console.error(error);
            },
        });
    });
});
