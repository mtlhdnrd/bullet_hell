
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

function LoadCharacters(){
    
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "characters"},
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

addEventListener("load", (event) => {
    switch(document.body.dataset.page)
    {
        case "maps":
            LoadMaps();
            break;
        case "characters":
            LoadCharacters();
            break;
    }
});