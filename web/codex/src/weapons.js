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
let currentWeapon = -1;
let weaponcache = [];

$(document).ready(function() {
    LoadWeapons();
});

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
                let img = new Image();
                img.src = `../src/images/weapons/${weapon.file_name}`;
                weaponcache.push(img);
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

function DisplayHeroWeapon() {
    let heroWeapon =
        currentWeapon === -1 ? weapons[0] : GetWeaponById(currentWeapon);
    let heroSection = `
            <div class="container-fluid">
        <div class="row">
            <div class="col-12 hero-element text-white">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-sm-12 my-5">
                            <h2>${heroWeapon.name}</h2>
                            <ul>
                                <li>Damage: ${heroWeapon.damage}</li>
                                <li>Fire rate: ${heroWeapon.fire_rate}</li>
                                <li>Semi auto: ${heroWeapon.semi_auto}</li>
                                <li>Rarity: ${heroWeapon.rarity}</li>
                                <li>Projectile speed: ${heroWeapon.projectile_speed === null
            ? "-"
            : heroWeapon.projectile_speed
        }</li>
                                <li>Magazine: ${heroWeapon.mag === null
            ? "-"
            : heroWeapon.mag
        }</li>

                           </ul>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <img src="../src/images/weapons/${heroWeapon.file_name
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
    $(".hero-section").html(heroSection);
}

function DisplayWeapons() {
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
                    <div class="codex-tile d-flex flex-column align-items-center swap-btn" id="weapon-${weapons[weaponIndex].id}">
                        <img src="../src/images/weapons/display/${weapons[weaponIndex].name}/${weapons[weaponIndex].name}_1_00000.png" alt="${weapons[weaponIndex].name}" class="w-100 anti-alias img-fluid position-relative" id="weapon-img-${weapons[weaponIndex].id}">
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
    $(".other-weapons-section").html(containerHtml);
    $(".swap-btn").click(function () {
        let index = $(this).attr("id").split('-')[1];
        currentWeapon = index;
        $('.hero-section')[0].scrollIntoView();
        DisplayHeroWeapon();
    });

    weapons.forEach(weapon => {
            $(`#weapon-${weapon.id}`).css("background-image", `url("../src/images/weapons/display/${weapon.name}/${weapon.name}_2_00000.png")`);
    });
    DisplayHeroWeapon();
}
