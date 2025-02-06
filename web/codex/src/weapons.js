export class Weapon {
    constructor(
        id,
        name,
        file_name,
        damage,
        fire_rate,
        semi_auto,
        rarity,
        projectile_speed,
        mag,
        description,
        devinfo
    ) {
        this.id = id;
        this.name = name;
        this.file_name = file_name;
        this.damage = damage;
        this.fire_rate = fire_rate;
        this.semi_auto = semi_auto;
        this.rarity = rarity;
        this.projectile_speed = projectile_speed;
        this.mag = mag;
        this.description = description;
        this.devinfo = devinfo;
    }

    DebugInfo() {
        const separator = "-".repeat(30);
        return `
            ${separator}
            Weapon Debug Info:
            ${separator}
            ID: ${this.id}
            Name: ${this.name}
            File Name: ${this.file_name}
            Damage: ${this.damage}
            Fire Rate: ${this.fire_rate}
            Semi Auto: ${this.semi_auto ? "Yes" : "No"} 
            Rarity: ${this.rarity}
            Projectile Speed: ${this.projectile_speed}
            Magazine Size: ${this.mag}
            Description: ${this.description}
            Dev Info: ${this.devinfo}
            ${separator}
                    `;
    }
}

export class WeaponFactory {
    constructor(id, name, file_name) {
        this.id = id;
        this.name = name;
        this.file_name = file_name;
        this.damage = 0;
        this.fire_rate = 0;
        this.semi_auto = true;
        this.rarity = "";
        this.projectile_speed = 0;
        this.mag = 0;
        this.description = "";
        this.devinfo = "";
    }

    SetParams(
        damage,
        fire_rate,
        semi_auto,
        rarity,
        projectile_speed,
        mag,
        description,
        devinfo
    ) {
        this.damage = damage;
        this.fire_rate = fire_rate;
        this.semi_auto = semi_auto;
        this.rarity = rarity;
        this.projectile_speed = projectile_speed;
        this.mag = mag;
        this.description = description;
        this.devinfo = devinfo;
    }

    Build() {
        return new Weapon(
            this.id,
            this.name,
            this.file_name,
            this.damage,
            this.fire_rate,
            this.semi_auto,
            this.rarity,
            this.projectile_speed,
            this.mag,
            this.description,
            this.devinfo
        );
    }
}

var weapons = [];
const urlParams = new URLSearchParams(window.location.search);
let currentWeapon = parseInt(
    urlParams.get("weapon") == 0 ? -1 : urlParams.get("weapon")
);
addEventListener("load", LoadWeapons());

function LoadWeapons() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "weapons" },
        dataType: "json",
        success: function (data, textStatus, xhr) {
            $.each(data, function (index, weapon) {
                weapons.push(
                    new Weapon(
                        weapon.id,
                        weapon.name,
                        weapon.file_name,
                        weapon.damage,
                        weapon.fire_rate,
                        weapon.semi_auto,
                        weapon.rarity,
                        weapon.projectile_speed,
                        weapon.mag,
                        weapon.description,
                        weapon.devinfo
                    )
                );
            });
            DisplayWeapons();
        },
    });
}

function GetWeaponById(id) {
    //Returns a weapon from the weapons list that has matching id
    let i = 0;
    while (i < weapons.length && weapons[i].id != id) {
        i++;
    }
    if (i < weapons.length) return weapons[i];
    else return null;
}

function DisplayWeapons() {
    let heroWeapon =
        currentWeapon === -1 ? weapons[0] : GetWeaponById(currentWeapon);
    let heroSection = `
            <div class="container-fluid">
        <div class="row">
            <div class="col-12 hero-element bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-sm-12 my-5">
                            <h2>${heroWeapon.name}</h2>
                            <ul>
                                <li>Damage: ${heroWeapon.damage}</li>
                                <li>Fire rate: ${heroWeapon.fire_rate}</li>
                                <li>Semi auto: ${heroWeapon.semi_auto}</li>
                                <li>Rarity: ${heroWeapon.rarity}</li>
                                <li>Projectile speed:${
                                    heroWeapon.projectile_speed === null
                                        ? "-"
                                        : heroWeapon.projectile_speed
                                }</li>
                                <li>Magazine: ${
                                    heroWeapon.mag === null
                                        ? "-"
                                        : heroWeapon.mag
                                }</li>

                           </ul>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <img src="../src/images/${
                                heroWeapon.file_name
                            }" class="d-block mx-auto img-fluid anti-alias hero-image" alt="">
                        </div>
                        <div class="col-lg-4 col-sm-12 my-5">
                            <p>${heroWeapon.description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;

    let rowNum =
        parseInt(weapons.length) % 4 == 0
            ? parseInt(weapons.length / 4)
            : parseInt(weapons.length / 4 + 1);
    let containerHtml = `<div class="container pb-5 pt-3">`;
    let rowContent = [];
    let weaponIndex = 0;
    for (let rn = 0; rn < rowNum; rn++) {
        let rowStr = `
            <div class="row">
        `;
        for (let cn = 0; cn < 4; cn++) {
            if (weaponIndex < weapons.length) {
                rowStr += `
                <div class="col-lg-3 col-sm-12 p-0">
                    <div class="codex-tile d-flex flex-column align-items-center swap-btn" id=${weapons[weaponIndex].id}>
                        <img src="../src/images/${weapons[weaponIndex].file_name}" alt="${weapons[weaponIndex].name}" class="img-thumbnail w-50 anti-alias img-fluid">
                        <div class="text-center">${weapons[weaponIndex].name}</div>
                    </div>
                </div>`;
            }
            weaponIndex += 1;
        }
        rowStr += `</div>`;
        rowContent.push(rowStr);
    }

    rowContent.forEach((row) => {
        containerHtml += row;
    });
    containerHtml += "</div>";
    $(".hero-section").html(heroSection);
    $(".other-weapons-section").html(containerHtml);

    $(".swap-btn").click(function () {
        let index = $(this).attr("id");
        currentWeapon = index;
        DisplayWeapons();
    });
}
