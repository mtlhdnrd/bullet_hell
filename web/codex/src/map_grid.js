export class Map {
    constructor(
        name,
        file_name,
        description,
        music_pack_name,
        music_pack_description
    ) {
        this.name = name;
        this.file_name = file_name;
        this.description = description;
        this.music_pack_name = music_pack_name;
        this.music_pack_description = music_pack_description;
    }

    DebugInfo() {
        return `Map object with name: ${this.name}, file name: ${this.file_name}, description: ${this.description}, and music_pack_id: ${this.music_pack_id}`;
    }
}

var maps = [];
var currentMap = 0;
LoadMaps();

function LoadMaps() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "maps" },
        dataType: "json", // Expect JSON response
        success: function (data, textStatus, xhr) {
            var container = $(".map-container"); // Select the container
            $.each(data, function (index, map) {
                maps.push(
                    new Map(
                        map.name,
                        map.map_file_name,
                        map.map_description,
                        map.music_pack_name,
                        map.music_pack_description
                    )
                );
            });
        },
        error: function(xhr, status, error){
            console.error(error);
        }
    }).then((result) => {
        DisplayMaps();
    });
}

function DisplayMaps() {
    let rowNum =
        parseInt(maps.length) % 3 == 0
            ? parseInt(maps.length / 3)
            : parseInt(maps.length / 3 + 1);
    let containerHtml = `<div class="container pb-5 pt-3">`;
    let rowContent = [];
    let mapIndex = 0;
    for (let _row = 0; _row < rowNum; _row++) {
        let rowStr = `
            <div class="row">
        `;
        for (let _column = 0; _column < 3; _column++) {
            if (mapIndex < maps.length) {
                rowStr += `
                <div class="col-lg-4 col-sm-12 px-0 py-2">
                    <div class="weapon-tile d-flex flex-column align-items-center swap-btn" id=${mapIndex}>
                        <img src="../src/images/maps/${maps[mapIndex].file_name}" alt="${maps[mapIndex].name}" class="img-thumbnail w-50">
                        <div class="text-center">${maps[mapIndex].name}</div>
                    </div>
                </div>`;
            }
            mapIndex += 1;
        }
        rowStr += `</div>`;
        rowContent.push(rowStr);
    }

    rowContent.forEach((row) => {
        containerHtml += row;
    });
    containerHtml += "</div>";
    $(".maps-section").html(containerHtml);
    $(".swap-btn").click(function () {
        currentMap = parseInt($(this).attr("id"));
        window.location = `map_details.php?id=${currentMap}`;
    });
}
export { maps, currentMap };
