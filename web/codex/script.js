
function LoadMaps() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "maps" },
        dataType: 'json', // Expect JSON response
        success: function (data, textStatus, xhr) {
            var container = $('.map-container'); // Select the container

            $.each(data, function (index, map) {
                var mapBlock = `
         <div class="row bg-light mx-auto map-block mb-4">
  <div class="col-12 d-flex flex-column align-items-center"> 
    <img src="${map.file_name}" class="img-fluid" alt="${map.name}" width="500" height="200">
    <div class="text-start w-100"> <div class="col-12"> 
      <h2>${map.name}</h2>
      <p>${map.description}</p>
    </div>
  </div> 
</div>`;
                container.append(mapBlock);
            });
        }
    });
}

function LoadCharacters() {

    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "characters" },
        dataType: 'json', // Expect JSON response
        success: function (data, textStatus, xhr) {
            var container = $('.character-container'); // Select the container

            $.each(data, function (index, characters) {
                var characterBlock = `
         <div class="row bg-light mx-auto map-block mb-4">
  <div class="col-12 d-flex flex-column align-items-center"> 
    <img src="${characters.file_name}" class="img-fluid" alt="${characters.name}" width="500" height="200">
    <div class="text-start w-100"> <div class="col-12"> 
      <h2>${characters.name}</h2>
      <p>${characters.description}</p>
      <p>${characters.ownership_status}</p>
    </div>
  </div> 
</div>`;
                container.append(characterBlock);
            });
        }
    });
}

function LoadMusic() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "music" },
        dataType: 'json', // Expect JSON response
        success: function (data, textStatus, xhr) {
            var container = $('.music-container'); // Select the container

            $.each(data, function (index, music) {
                var characterBlock = `
         <div class="row bg-light mx-auto map-block mb-4">
  <div class="col-12 d-flex flex-column align-items-center"> 
    <img src="${music.main_menu_theme1}" class="img-fluid" alt="${music.name}" width="500" height="200">
    <div class="text-start w-100"> <div class="col-12"> 
      <h2>${music.anthem}</h2>
      <p>${music.description}</p>
    </div>
  </div> 
</div>`;
                container.append(characterBlock);
            });
            //Bindig individual event handlers to collapse toggler buttons
            var togglerButtons = $('.weapon-container').find('.collapse');
            togglerButtons.each(function () {
                $(this).on('show.bs.collapse hide.bs.collapse', function () {
                    $(this).prev().find("i").toggleClass("fa-solid fa-chevron-down fa-solid fa-chevron-up");
                });
            });
        }
    });
}

function LoadWeapons() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "weapons" },
        dataType: 'json',
        success: function (data, textStatus, xhr) {
            var container = $('.weapon-container'); // Select the container
            var togglerNumber = 0;
            $.each(data, function (index, weapon) {
                var characterBlock = `<div class="row bg-light mx-auto map-block mb-4">
                <div class="col-12 d-flex flex-column align-items-center">
                    <img src="${weapon.file_name}" class="img-fluid" alt="knight_web.png" width="500" height="200">
                    <div class="text-start w-100">
                        <div class="col-12">
                            <h2>${weapon.name}</h2>
                            <p>${weapon.description}</p>
                            <a href="#weaponToggler${togglerNumber}" data-toggle="collapse" aria-expanded="false"><i class="fa-solid fa-chevron-down"></i></a>

                            <div class="collapse" id="weaponToggler${togglerNumber}">
                                <p>Damage: ${weapon.damage}</p>
                                <p>Fire rate: ${weapon.fire_rate}</p>
                                <p>Semi auto: ${weapon.semi_auto == "1"? "Yes":"No"}</p>
                                <p>Rarity: ${weapon.rarity}</p>
                                <p>Projectile speed: ${weapon.projectile_speed === null ? "-":weapon.projectile_speed}</p>
                                <p>Magazine: ${weapon.mag === null ? "-":weapon.mag}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>`;
                container.append(characterBlock);
            });
        }
    });
}

addEventListener("load", (event) => {
    switch (document.body.dataset.page) {
        case "maps":
            LoadMaps();
            break;
        case "characters":
            LoadCharacters();
            break;
        case "music":
            LoadMusic();
            break;
        case "weapons":
            LoadWeapons();
            break;
    }
});

function SearchForItem(page, value) {
    switch (page) {
        case "maps":
            $.ajax({
                type: "GET",
                url: "load_codex_data.php",
                data: { data_type: "maps", condition: "name LIKE '" + value + "%'" },
                dataType: 'json',
                success: function (data, textStatus, xhr) {
                    var container = $('.map-container'); // Select the container
                    container.html("");
                    container.append(``)
                    $.each(data, function (index, maps) {
                        var characterBlock = `
                 <div class="row bg-light mx-auto map-block mb-4">
          <div class="col-12 d-flex flex-column align-items-center"> 
            <img src="${maps.file_name}" class="img-fluid" alt="${maps.name}" width="500" height="200">
            <div class="text-start w-100"> <div class="col-12"> 
              <h2>${maps.name}</h2>
              <p>${maps.description}</p>
              <p>${maps.ownership_status}</p>
            </div>
          </div> 
        </div>`;
                        container.append(characterBlock);
                    });
                }
            }
            );
            break;
        case "characters":
            $.ajax({
                type: "GET",
                url: "load_codex_data.php",
                data: { data_type: "characters", condition: "name LIKE '" + value + "%'" },
                dataType: 'json',
                success: function (data, textStatus, xhr) {
                    var container = $('.character-container'); // Select the container
                    container.html("");
                    $.each(data, function (index, character) {
                        var characterBlock = `
                 <div class="row bg-light mx-auto map-block mb-4">
          <div class="col-12 d-flex flex-column align-items-center"> 
            <img src="${character.file_name}" class="img-fluid" alt="${character.name}" width="500" height="200">
            <div class="text-start w-100"> <div class="col-12"> 
              <h2>${character.name}</h2>
              <p>${character.description}</p>
              <p>${character.ownership_status}</p>
            </div>
          </div> 
        </div>`;
                        container.append(characterBlock);
                    });
                }
            }
            );
            break
        case "music":
            $.ajax({
                type: "GET",
                url: "load_codex_data.php",
                data: { data_type: "music", condition: "name LIKE '" + value + "%'" },
                dataType: 'json',
                success: function (data, textStatus, xhr) {
                    var container = $(".music-container");
                    container.html("");
                    $.each(data, function (index, music) {
                        var characterBlock = `
         <div class="row bg-light mx-auto map-block mb-4">
  <div class="col-12 d-flex flex-column align-items-center"> 
    <img src="${music.main_menu_theme1}" class="img-fluid" alt="${music.name}" width="500" height="200">
    <div class="text-start w-100"> <div class="col-12"> 
      <h2>${music.anthem}</h2>
      <p>${music.description}</p>
    </div>
  </div> 
</div>`;
                        container.append(characterBlock);
                    });
                }
            });
            break;
        case "weapons":
            $.ajax({
                type: "GET",
                url: "load_codex_data.php",
                data: { data_type: "weapons", condition : "name LIKE '"+value+"%'"},
                dataType: 'json',
                success: function (data, textStatus, xhr) {
                    var container = $(".weapon-container");
                    container.html("");
                    var togglerNumber = 0;
                    $.each(data, function (index, weapon) {
                        var characterBlock = `<div class="row bg-light mx-auto map-block mb-4">
                        <div class="col-12 d-flex flex-column align-items-center">
                            <img src="${weapon.file_name}" class="img-fluid" alt="knight_web.png" width="500" height="200">
                            <div class="text-start w-100">
                                <div class="col-12">
                                    <h2>${weapon.name}</h2>
                                    <p>${weapon.description}</p>
                                    <a href="#weaponToggler${togglerNumber}" data-toggle="collapse" aria-expanded="false"><i class="fa-solid fa-chevron-down"></i></a>
        
                                    <div class="collapse" id="weaponToggler${togglerNumber}">
                                        <p>Damage: ${weapon.damage}</p>
                                        <p>Fire rate: ${weapon.fire_rate}</p>
                                        <p>Semi auto: ${weapon.semi_auto == "1"? "Yes":"No"}</p>
                                        <p>Rarity: ${weapon.rarity}</p>
                                        <p>Projectile speed: ${weapon.projectile_speed === null ? "-":weapon.projectile_speed}</p>
                                        <p>Magazine: ${weapon.mag === null ? "-":weapon.mag}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>`;
                        container.append(characterBlock);
                    });
                }
            });
    }
}

$(document).ready(function () {
    $('#search-bar').keyup(function (event) {
        SearchForItem(document.body.dataset.page, $("#search-bar").val());
    });
});