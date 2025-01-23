class Weapon {
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

let weapons = [];

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
                            <h2>${weapons[0].name}</h2>
                            <ul>
                                <li>Damage: ${weapons[0].damage}</li>
                                <li>Fire rate: ${weapons[0].fire_rate}</li>
                                <li>Semi auto: ${weapons[0].semi_auto}</li>
                                <li>Rarity: ${weapons[0].rarity}</li>
                                <li>Projectile speed:${weapons[0].projectile_speed === null ? "-":weapons[0].projectile_speed}}</li>
                                <li>Magazine: ${weapons[0].mag === null ? "-":weapons[0].mag}</li>

                           </ul>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <img src="../src/images/2.png" class="d-block mx-auto img-fluid" alt="">
                        </div>
                        <div class="col-lg-4 col-sm-12 my-5">
                            <p>${weapons[0].description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;
    $('.hero-section').append(heroSection);
}
