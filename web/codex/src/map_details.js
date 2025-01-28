
import {Map} from './map_grid.js';
import {Weapon, WeaponFactory} from './weapons.js';
var maps = [];
var weapons = [];
function LoadMaps() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "maps" },
        dataType: 'json', // Expect JSON response
        success: function (data, textStatus, xhr) {
            $.each(data, function (index, map) {
                maps.push(new Map(map.name, map.file_name, map.description, map.music_pack_name, map.music_pack_description));
            });
        }
    }).then((result) => {
        DisplayMap();
    });;

}
LoadMaps();
const urlParams = new URLSearchParams(window.location.search);
const currentMap = urlParams.get('id');
function DisplayMap() {
    let map = maps[currentMap];
    let detailsHtml = `
<div class="container">
        <h1>${map.name}</h1>
        <div class="row">
            <div class="col-lg-9 col-sm-12">
                <img src="../src/images/wallpaper_test.png" alt="" class="img-fluid">
            </div>
            <div class="col-lg-3 col-sm-12">
                <div class="description-attribute">Description</div>
                <p>${map.description}</p>
                <div class="description-attribute">Music</div>
                <p><span class="text-info">${map.music_pack_name}</span> - ${map.music_pack_description}</p>
            </div>
        </div>
    </div>
`;
    $(".map-details").html(detailsHtml);
}

function LoadMapWeapons(){
    $.ajax({
        type: "GET",
        url: "load_map_weapons.php",
        data: {map: currentMap},
        dataType: 'json',
        success: function(data, textStatus, xhr){
            $.each(data, function (index, weapon) {
                let wf = new WeaponFactory(weapon.id, weapon.name, weapon.file_name);
                weapons.push(wf.Build());
            });
        }
    }).then((result)=>{
        DisplayMapWeapons();
    });
}
function DisplayMapWeapons(){
    console.log(weapons);
    weapons.forEach(weapon =>{console.log(weapon.DebugInfo());});
}