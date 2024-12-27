
function GetMaps() {
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
    <img src="${map.image}" class="img-fluid" alt="${map.name}" width="500" height="200">
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
function LoadMaps(map_data) {

}

addEventListener("load", (event) => {
    GetMaps();
});