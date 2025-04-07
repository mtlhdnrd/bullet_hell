# 0NF
bullet_hell (*map_id*, map_name, map_file_name, map_desc, *music_pack_id*, music_pack_name, music_pack_cover_image, music_pack_anthem, music_pack_menu1, music_pack_menu2, music_pack_desc, *player_username*, player_points, player_all_wins, player_all_games, player_kills, player_deaths, player_current_music, player_current_skin, player_password, player_is_admin, *weapon_id*, weapon_name, weapon_file, weapon_damage, weapon_fire_rate, weapon_semi_auto, weapon_rarity_id, weapon_rarity, weapon_projectile_speed, weapon_mag, weapon_desc, weapon_devinfo, *player_skin_id*, player_skin_name, player_skin_display_image, player_skin_background_image, player_skin_desc)

# 1NF
players (*player_username*, player_points, player_all_wins, player_all_games, player_kills, player_deaths, player_current_music, player_current_skin, player_password, player_is_admin)

bullet_hell (*map_id*, map_name, map_file_name, map_desc, *music_pack_id*, music_pack_name, music_pack_cover_image, music_pack_anthem, music_pack_menu1, music_pack_menu2, music_pack_desc, *player_username*, *weapon_id*, weapon_name, weapon_file, weapon_damage, weapon_fire_rate, weapon_semi_auto, weapon_rarity_id, weapon_rarity, weapon_projectile_speed, weapon_mag, weapon_desc, weapon_devinfo, *player_skin_id*, player_skin_name, player_skin_display_image, player_skin_background_image, player_skin_desc)

# 2NF
players (*player_username*, player_points, player_all_wins, player_all_games, player_kills, player_deaths, player_current_music, player_current_skin, player_password, player_is_admin)

maps (*map_id*, map_name, map_file_name, map_desc, music_pack_id)

music_packs (*music_pack_id*, music_pack_name, music_pack_cover_image, music_pack_anthem, music_pack_menu1, music_pack_menu2, music_pack_desc)

weapons (*weapon_id*, weapon_name, weapon_file, weapon_damage, weapon_fire_rate, weapon_semi_auto, weapon_rarity_id, weapon_projectile_speed, weapon_mag, weapon_desc, weapon_devinfo)

rarities (*weapon_rarity_id*, weapon_rarity)

player_skins (*player_skin_id*, player_skin_name, player_skin_display_image, player_skin_background_image, player_skin_desc)

map_weapons (*map_id*, *weapon_id*)

player_skin_inventory (*player_id*, *skin_id*)

player_music_inventory (*player_id*, *music_pack_id*)

# 3NF
maps (*id*, name, file_name, description, music_pack_id)

map_weapons (*map_id*, *weapon_id*)

music_packs (*id*, name, cover_image, anthem, main_menu_theme1, main_menu_theme2, description)

players (*username*, points, all_wins, all_games_played, kills, deaths, music_pack_id, active_skin_id) [^1]

player_login (*username*, password, is_admin)

player_music_inventory (*player_id*, *music_pack_id*)

player_skins (*id*, name, display_image, background_image, description)

player_skin_inventory (*player_id*, *skin_id*)

rarities (*id*, rarity)

weapons (*id*, name, file_name, damage, fire_rate, semi_auto, rarity_id, projectile_speed, mag, description, devinfo)

[^1]: doesnt technically have to be two separate tables but it makes sense to not mix login info with gameplay data
