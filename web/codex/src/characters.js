export class Character {
    constructor(id, name, display_image, background_image, description) {
        this.id = id;
        this.name = name;
        this.display_image = display_image;
        this.background_image = "character-slide-sample.jpg";
        this.description = description;
    }

    DebugInfo() {
        const separator = "-".repeat(30);
        return `
            ${separator}
            Character Debug Info:
            ${separator}
            ID: ${this.id}
            Name: ${this.name}
            File Name: ${this.display_image}
            Description: ${this.description}
            ${separator}
                    `;
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
            $.each(data, function (index, character) {
                characters.push(
                    new Character(
                        character.id,
                        character.name,
                        character.display_image,
                        character.background_image,
                        character.description
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
    let characterSlides = '';
    characters.forEach(character => {
       characterSlides += `
                <div class="character-slide p-0" id="${character.id}">
                    <div class="row mx-auto">
                        <div class="col-lg-7 col-sm-12 my-5 text-left">
                            <h2 class="d-inline">${character.name}</h2>
                            <p>${character.description}</p>
                        </div>
                        <div class="col-lg-5 col-sm-12">
                            <img src="${character.display_image}" class="d-block img-fluid profile-image anti-alias" alt="">
                        </div>
                    </div>
                </div>`;
    });
    $('.character-slides-container').html(characterSlides);
    $(".character-slide").each(function() {
        let charId = $(this).attr("id");
        let character = GetCharacterById(charId); // Store the result for efficiency
        if (character && character.background_image) { // Check if character and image exist
            console.log(character.background_image);
            $(this).css("background-image", `url(../src/images/${character.background_image})`);

        } else {
            console.warn(`No background image found for character with ID: ${charId}`);
        }
    });
}
$(document).ready(function() {
    LoadCharacters();
    
});
