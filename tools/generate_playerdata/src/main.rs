use mysql::prelude::*;
use mysql::*;
use rand::prelude::*;
use sha2::{Digest, Sha512};

struct Player {
    username: String,
    points: i32,
    all_wins: i32,
    all_games_played: i32,
    kills: i32,
    deaths: i32,
    music_pack_id: i32,
    active_skin_id: i32,
}

impl Player {
    fn new(username: String) -> Self {
        let mut rng = rand::rng();

        let all_games_played = rng.random_range(0..=511);
        let all_wins = rng.random_range(0..=all_games_played);
        let kills = all_wins * 3;
        let deaths = (all_wins as f32 * rng.random_range(0.0..=2.0)
            + (all_games_played - all_wins) as f32 * rng.random_range(2.0..=3.0))
            as i32;
        let points = kills * 25 + deaths * -25;
        let music_pack_id = rng.random_range(1..=5);
        let active_skin_id = rng.random_range(1..=5);

        Self {
            username,
            points,
            all_wins,
            all_games_played,
            kills,
            deaths,
            music_pack_id,
            active_skin_id,
        }
    }
}

struct PlayerLogin {
    username: String,
    password: String,
    is_admin: bool,
}

impl PlayerLogin {
    fn new(username: String) -> Self {
        let mut rng = rand::rng();
        let mut hasher = Sha512::new();
        hasher.update(username.as_bytes());
        let hash = format!("{:x}", hasher.finalize());

        Self {
            username,
            password: hash,
            is_admin: rng.random_bool(1.0 / 100.0),
        }
    }
}

fn main() -> std::result::Result<(), Box<dyn std::error::Error>> {
    let mut rng = rand::rng();
    let mut players: Vec<Player> = vec![];
    let mut logins: Vec<PlayerLogin> = vec![];

    let number_of_players = match std::env::args().nth(1) {
        Some(number) => number.parse::<i32>().unwrap_or(100),
        None => 100,
    };

    for _ in 0..number_of_players {
        let username: String = (0..30)
            .map(|_| rng.sample(rand::distr::Alphanumeric) as char)
            .collect();
        let player = Player::new(username.clone());
        let login = PlayerLogin::new(username.clone());
        players.push(player);
        logins.push(login);
    }

    let url = "mysql://root:@localhost:3306/bullet_hell";
    let pool = Pool::new(url)?;
    let mut conn = pool.get_conn()?;

    conn.exec_batch(
        r"INSERT INTO players (username, points, all_wins, all_games_played, kills, deaths, music_pack_id, active_skin_id)
          VALUES (:username, :points, :all_wins, :all_games_played, :kills, :deaths, :music_pack_id, :active_skin_id)",
        players.iter().map(|p| params! {
            "username" => p.username.clone(),
            "points" => p.points,
            "all_wins" => p.all_wins,
            "all_games_played" => p.all_games_played,
            "kills" => p.kills,
            "deaths" => p.deaths,
            "music_pack_id" => p.music_pack_id,
            "active_skin_id" => p.active_skin_id,
        })
    )?;
    conn.exec_batch(
        r"INSERT INTO player_login (username, password, is_admin)
          VALUES (:username, :password, :is_admin)",
        logins.iter().map(|l| {
            params! {
                "username" => l.username.clone(),
                 "password" => l.password.clone(),
                 "is_admin" => l.is_admin,
            }
        }),
    )?;

    Ok(())
}
