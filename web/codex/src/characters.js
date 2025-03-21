export class Character {
  constructor(id, name, display_image, background_image, description, ownership_status) {
    this.id = id;
    this.name = name;
    this.display_image = display_image;
    this.background_image = background_image;
    this.description = description;
    this.ownership_status = ownership_status;
  }
}

var characters = [];
function LoadCharacters() {
  $.ajax({
    type: "GET",
    url: "load_codex_data.php",
    data: { data_type: "characters" },
    dataType: "json",
    success: function (data, textStatus, xhr) {
      $.each(data, function (index, char) {
        characters.push(
          new Character(
            char.id,
            char.name,
            char.display_image,
            char.background_image,
            char.description,
            char.ownership_status
          )
        );
      });
      DisplayCharacters();
    },
  });
}

function GetCharacterById(id) {
  //Returns a character from the characters list that has matching id
  let i = 0;
  while (i < characters.length && characters[i].id != id) {
    i++;
  }
  if (i < characters.length) return characters[i];
  else return null;
}

function DisplayCharacters() {
  let characterSlides = "";
  characters.forEach((character) => {
    characterSlides += `
                <div class="character-slide p-0 w-100 position-relative" id="${character.id}">
                </div>`;
  });
  $(".character-slides-container").html(characterSlides);
  $(".character-slide").each(function () {
    let charId = $(this).attr("id");
    let character = GetCharacterById(charId);
    if (character && character.background_image) {
      $(this).css(
        "background",
        `url(../src/images/characters/display/${character.name}/${character.background_image})`
      );
      $(this).css("background-size", `cover`);
      $(this).append(`<img src="../src/images/characters/display/${character.name}/${character.name}.png" class="character-image" alt="${character.name}">`);
    } else {
      console.warn(
        `No background image found for character with ID: ${charId}`
      );
    }
  });

  $(".character-slide")
    .on("mouseenter", function () {
      let $this = $(this);

      // Create overlay element
      let $overlay = $('<div class="overlay"></div>');
      $this.append($overlay); // Append the overlay FIRST

      //Create description text element
      let character = GetCharacterById($this.attr("id"));
      let descriptionText = character.description;
      let $description = $(
        `<p class="description-text">${descriptionText} - <span class="${character.ownership_status == 'Unlocked' ? 'unlocked' : 'locked'}-status">${character.ownership_status}</span></p>`
      );
      $this.append($description);

      //Slide in animation
      $description.animate(
        {
          left: "0",
        },
        300,
        "swing"
      );
    })
    .on("mouseleave", function () {
      let $this = $(this);
      let $description = $this.find(".description-text"); // Find the specific description text
      let $overlay = $this.find(".overlay");

      $description.animate(
        {
          left: "100%",
        },
        300,
        "swing",
        function () {
          // Remove when animation is complete
          $description.remove();
          $overlay.remove();
        }
      );
    });
}
$(document).ready(function () {
  LoadCharacters();
});
