export class Weapon {
    constructor(id, name, file_name, damage, fire_rate, semi_auto, rarity, projectile_speed, mag, description, devinfo) {
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

export class WeaponFactory{
    constructor(id, name, file_name) {
        this.id = id
        this.name = name;
        this.file_name = file_name;
        this.damage = 0
        this.fire_rate = 0
        this.semi_auto = true;
        this.rarity = "";
        this.projectile_speed = 0;
        this.mag = 0;
        this.description = "";
        this.devinfo = "";
    }

    SetParams(damage, fire_rate, semi_auto, rarity, projectile_speed, mag, description, devinfo){
        this.damage = damage;
        this.fire_rate = fire_rate;
        this.semi_auto = semi_auto;
        this.rarity = rarity;
        this.projectile_speed = projectile_speed;
        this.mag = mag;
        this.description = description;
        this.devinfo = devinfo;
    }

    Build(){
        return new Weapon(id, this.name, file_name, damage, fire_rate, semi_auto, rarity, projectile_speed, mag, description, devinfo);
    }
}

let weapons = [];
const urlParams = new URLSearchParams(window.location.search);
let currentWeapon = urlParams.get('weapon');
addEventListener("load", LoadWeapons());

function LoadWeapons() {
    $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "weapons" },
        dataType: 'json',
        success: function (data, textStatus, xhr) {
            $.each(data, function (index, weapon) {
                weapons.push(new Weapon(weapon.id, weapon.name, weapon.file_name, weapon.damage, weapon.fire_rate, weapon.semi_auto, weapon.rarity, weapon.projectile_speed, weapon.mag, weapon.description, weapon.devinfo));
            });
            DisplayWeapons();
        }
    });
}
function DisplayWeapons() {
    let heroSection = `
            <div class="container-fluid">
        <div class="row">
            <div class="col-12 hero-element bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-sm-12 my-5">
                            <h2>${weapons[currentWeapon].name}</h2>
                            <ul>
                                <li>Damage: ${weapons[currentWeapon].damage}</li>
                                <li>Fire rate: ${weapons[currentWeapon].fire_rate}</li>
                                <li>Semi auto: ${weapons[currentWeapon].semi_auto}</li>
                                <li>Rarity: ${weapons[currentWeapon].rarity}</li>
                                <li>Projectile speed:${weapons[currentWeapon].projectile_speed === null ? "-":weapons[currentWeapon].projectile_speed}</li>
                                <li>Magazine: ${weapons[currentWeapon].mag === null ? "-":weapons[currentWeapon].mag}</li>

                           </ul>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <img src="${weapons[currentWeapon].file_name}" class="d-block mx-auto img-fluid" alt="">
                        </div>
                        <div class="col-lg-4 col-sm-12 my-5">
                            <p>${weapons[currentWeapon].description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;

    let rowNum = parseInt(weapons.length) % 4 == 0 ? parseInt(weapons.length/4) : parseInt(weapons.length/4+1);
    let containerHtml = `<div class="container pb-5 pt-3">`;
    let rowContent = [];
    let weaponIndex = 0;
    for (let rn = 0; rn < rowNum; rn++) {
        let rowStr = `
            <div class="row">
        `;
        for(let cn = 0; cn < 4; cn++)
        {
            weaponIndex+=1;
            if(weaponIndex < weapons.length)
            {
                rowStr += `
                <div class="col-lg-3 col-sm-12 p-0">
                    <div class="weapon-tile d-flex flex-column align-items-center swap-btn" id=${weaponIndex}>
                        <img src="../src/images/knight_web.png" alt="${weapons[weaponIndex].name}" class="img-thumbnail w-50">
                        <div class="text-center">${weapons[weaponIndex].name}</div>
                    </div>
                </div>`;
            }
        }
        rowStr+=`</div>`;
        rowContent.push(rowStr);
    }

    rowContent.forEach(row => {containerHtml+=row;});
    containerHtml+="</div>";
    $('.hero-section').html(heroSection);
    $('.other-weapons-section').html(containerHtml);

    $('.swap-btn').click(function() {
        let index = $(this).attr("id");
        currentWeapon = index;
        DisplayWeapons();
    });
}