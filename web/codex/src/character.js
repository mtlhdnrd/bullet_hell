export class Character {
    constructor(id, name, file_name, background_image, description) {
        this.id = id;
        this.name = name;
        this.file_name = file_name;
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
            File Name: ${this.file_name}
            Description: ${this.description}
            ${separator}
                    `;
    }
}

var characters = [];
const urlParams = new URLSearchParams(window.location.search);
let currentCharacter = parseInt(
    urlParams.get("character") == 0 ? -1 : urlParams.get("character")
);
addEventListener("load", LoadCharacters());

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
                        character.file_name,
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
    /*let heroCharacter =
        currentCharacter === -1
            ? characters[0]
            : GetCharacterById(currentCharacter);
    let heroSection = `

                <div class="character-slide container-fluid p-0">
                    <div class="row mx-auto">
                        <div class="col-lg-9 col-sm-12 my-5">
                            <h2>${heroCharacter.name}</h2>
                            <p>${heroCharacter.description}</p>
                        </div>
                        <div class="col-lg-3 col-sm-12">
                            <img src="${heroCharacter.file_name}" class="d-block mx-auto img-fluid" alt="">
                        </div>
                    </div>
                </div>
    `;

    let rowNum =
        parseInt(characters.length) % 4 == 0
            ? parseInt(characters.length / 4)
            : parseInt(characters.length / 4 + 1);
    let containerHtml = `<div class="container pb-5 pt-3">`;
    let rowContent = [];
    let characterIndex = 0;
    for (let rn = 0; rn < rowNum; rn++) {
        let rowStr = `
            <div class="row">
        `;
        for (let cn = 0; cn < 4; cn++) {
            if (characterIndex < characters.length) {
                rowStr += `
                <div class="col-lg-3 col-sm-12 p-0">
                    <div class="codex-tile d-flex flex-column align-items-center swap-btn" id=${characters[characterIndex].id}>
                        <div class="text-center">${characters[characterIndex].name}</div>
                    </div>
                </div>`;
            }
            characterIndex += 1;
        }
        rowStr += `</div>`;
        rowContent.push(rowStr);
    }

    rowContent.forEach((row) => {
        containerHtml += row;
    });
    containerHtml += "</div>";
    $(".character-container").html(heroSection);
    $(".other-characters-section").html(containerHtml);

    $(".swap-btn").click(function () {
        let index = $(this).attr("id");
        currentCharacter = index;
        DisplayCharacters();
    });*/
    let characterSlides = '';
    characters.forEach(character => {
       characterSlides += `
                <div class="character-slide p-0" id="${character.id}">
                    <div class="row mx-auto">
                        <div class="col-lg-9 col-sm-12 my-5">
                            <h2>${character.name}</h2>
                            <p>${character.description}</p>
                        </div>
                        <div class="col-lg-3 col-sm-12">
                            <img src="${character.file_name}" class="d-block mx-auto img-fluid" alt="">
                        </div>
                    </div>
                </div>`;
    });
    $('.character-slides-container').html(characterSlides);
}
$(document).ready(function() {
    $('.character-slide').each(function() {
        let charId = $(this).attr("id");
        let character = GetCharacterById(charId); // Store the result for efficiency
        if (character && character.background_image) { // Check if character and image exist
            $(this).css("background-image", `url('../../src/images/${character.background_image}')`); // Use template literal
        } else {
            console.warn(`No background image found for character with ID: ${charId}`);
        }
    });
});
