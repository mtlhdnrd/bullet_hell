function LoadMusic() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "music" },
        dataType: "json", // Expect JSON response
        success: function (data, textStatus, xhr) {
            var container = $(".music-container"); // Select the container
            $.each(data, function (index, music) {
                var characterBlock = `
         <div class="row text-white mx-auto music-block mb-4">
  <div class="col-12 d-flex flex-column align-items-center">
    <img src="../src/images/music/${music.cover_image}" class="img-fluid anti-alias" alt="${music.name}" width="500" height="200">
    <div class="text-start w-100"> <div class="col-12">
      <h2>${music.name}</h2>
      <p>${music.description}</p>
      <audio controls>
          <source src="../src/music/${music.anthem}" type="audio/flac">
          Your browser does not support the audio element.
      </audio>
    </div>
  </div>
</div>`;
                container.append(characterBlock);
            });

            $("audio").on("play", function () {
                $("audio").not(this).each(function (index, audio) {
                    audio.pause();
                });
            });
        },
    });
}

addEventListener("load", (event) => {
    LoadMusic();
});

function SearchForMusic(value) {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: {
            data_type: "music",
            condition: value,
        },
        dataType: "json",
        success: function (data, textStatus, xhr) {
            var container = $(".music-container");
            container.html("");
            $.each(data, function (index, music) {
                var musicBlock = `
                    <div class="row text-white mx-auto music-block mb-4">
  <div class="col-12 d-flex flex-column align-items-center">
    <img src="../src/images/music/${music.cover_image}" class="img-fluid anti-alias" alt="${music.name}" width="500" height="200">
    <div class="text-start w-100"> <div class="col-12">
      <h2>${music.name}</h2>
      <p>${music.description}</p>
      <audio controls>
          <source src="../src/music/${music.anthem}" type="audio/flac">
          Your browser does not support the audio element.
      </audio>
    </div>
  </div>
</div>`;
                container.append(musicBlock);
            });
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error);
            $(".music-container").html("<p>Error loading music data.</p>");
        }
    });
}
$(document).ready(function () {
    $("#search-bar").keyup(function (event) {
        SearchForMusic($("#search-bar").val());
    });
});
