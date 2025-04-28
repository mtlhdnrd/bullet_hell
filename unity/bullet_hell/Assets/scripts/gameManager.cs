using JetBrains.Annotations;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using Unity;
using UnityEngine.UI;
using UnityEngine.UIElements;
using System;
using UnityEngine.SceneManagement;
using UnityEngine.InputSystem;
public class gameManager : MonoBehaviour
{
    [Header("fight refs")]//fetched on initFight
    public healthbar healthbarP1;
    public healthbar healthbarP2;
    public GameObject player1;
    public GameObject player2;
    public fightUi fightUi;
    //+mapLoader dependency on init

    [Header("menu refs")]//fetched on menuInit
    public menu menuScript;

    [Header("common refs")]//fetched on both
    public musicPlayer musicPlayer;
    public passedData passedData;

    [Header("permanent refs")]//fetched on awake, or hardcoded from UI
    public mapLoader mapLoader;
    public weaponLoader weaponLoader;
    public spawnPositions spawnPositions;
    public playerAssets playerAssets;
    public musicAssets musicAssets;
    public lootGiver lootGiver;

    [Header("logs")]
    Scene activescene;
    public bool firstLaunch;
    public int p1Wins;//0,1,2
    public int p2Wins;//0,1,2
    public string winner;//"p1" or "p2"
    public bool ended = false;

    public void RecordResult(APIManager.Response response)
    {
        Debug.Log("Result: " + response.success);
    }
    private void FixedUpdate()//timer + end checks
    {
        if (roundEnd())
        {
            resetFight();
        }
        if (!ended && fightEnd())
        {
            ended = true;
            //winner by fightEnd
            StartCoroutine(APIManager.RecordGameResult(passedData.p1Name, passedData.p2Name, p1Wins, p2Wins, p2Wins, p1Wins, RecordResult));
            giveReward();

            SceneManager.LoadScene("menu");
        }
    }
    public void giveReward()
    {
        string reward = null;
        //skin or music
        if (UnityEngine.Random.Range(0, 2) > 0)
        {
            //skin
            reward = lootGiver.getSkinReward(winner, passedData.map, passedData);
            if (reward != null)//can give skin
            {
                //local reward update (skin)
                if (winner == "p1")
                {
                    passedData.p1Skins.Add(reward);
                }
                else
                {
                    passedData.p2Skins.Add(reward);
                }

                if (!passedData.devMode) { StartCoroutine(APIManager.AddSkinLoot(winner == "p1" ? passedData.p1Name : passedData.p2Name, reward)); }
            }
            else//fallback: music given
            {
                reward = lootGiver.getMusicReward(winner, passedData.map, passedData);
                if (reward != null)//can give music
                {
                    //local reward update (music)
                    if (winner == "p1")
                    {
                        passedData.p1Kits.Add(musicAssets.GetAssetByName(reward));
                    }
                    else
                    {
                        passedData.p2Kits.Add(musicAssets.GetAssetByName(reward));
                    }

                    if (!passedData.devMode) { StartCoroutine(APIManager.AddMusicLoot(winner == "p1" ? passedData.p1Name : passedData.p2Name, reward)); }
                }
            }
        }
        else//music
        {
            reward = lootGiver.getMusicReward(winner, passedData.map, passedData);

            if (reward != null)//can give music
            {
                if (!passedData.devMode) { StartCoroutine(APIManager.AddMusicLoot(winner == "p1" ? passedData.p1Name : passedData.p2Name, reward)); }
            }
            else//fallback: skin given
            {
                reward = lootGiver.getSkinReward(winner, passedData.map, passedData);
                if (reward != null)//can give skin
                {
                    if (!passedData.devMode) { StartCoroutine(APIManager.AddSkinLoot(winner == "p1" ? passedData.p1Name : passedData.p2Name, reward)); }
                }
            }
        }
    }
    public bool fightEnd()
    {
        if (p1Wins > 1)
        {
            winner = "p1";
            player1.SetActive(false);
            player2.SetActive(false);
            Debug.Log("player 1 wins");
            return true;
        }

        if (p2Wins > 1)
        {
            winner = "p2";
            player1.SetActive(false);
            player2.SetActive(false);
            Debug.Log("player 2 wins");
            return true;
        }
        return false;
    }
    public bool roundEnd()
    {
        if (activescene.name == "fight")
        {
            if (player1.GetComponent<playerHealth>().dead)//player1 dies
            {
                p2Wins++;
                foreach (GameObject projectile in GameObject.FindGameObjectsWithTag("projectile"))//no shot lands
                {
                    Destroy(projectile);
                }
                return true;
            }
            else if (player2.GetComponent<playerHealth>().dead)//player2 dies
            {
                p1Wins++;
                foreach (GameObject projectile in GameObject.FindGameObjectsWithTag("projectile"))//no shot lands
                {
                    Destroy(projectile);
                }
                return true;
            }
            else if (fightUi.timeLeft < 0 && player1.GetComponent<playerHealth>().currentHealth > player2.GetComponent<playerHealth>().currentHealth)//p1 by time
            {
                p1Wins++;
                foreach (GameObject projectile in GameObject.FindGameObjectsWithTag("projectile"))//no shot lands
                {
                    Destroy(projectile);
                }
                return true;
            }
            else if (fightUi.timeLeft < 0 && player1.GetComponent<playerHealth>().currentHealth < player2.GetComponent<playerHealth>().currentHealth)//p2 by time
            {
                p2Wins++;
                foreach (GameObject projectile in GameObject.FindGameObjectsWithTag("projectile"))//no shot lands
                {
                    Destroy(projectile);
                }
                return true;
            }
            else if (fightUi.timeLeft < 0)//time spent
            {
                foreach (GameObject projectile in GameObject.FindGameObjectsWithTag("projectile"))//no shot lands
                {
                    Destroy(projectile);
                }
                Debug.Log("no activity, restarting");

                return true;
            }
        }
        return false;
    }
    private void Awake()
    {
        if (SceneManager.GetActiveScene().name == "menu")
        {
            initMenu();
        }
        else if (SceneManager.GetActiveScene().name == "fight")
        {
            initFight();
        }
        passedData.firstLoad = false;
    }
    public void initMenu()
    {
        UnityEngine.Cursor.lockState = CursorLockMode.Confined;
        activescene = SceneManager.GetActiveScene();
        UnityEngine.Cursor.visible = true;
        setRefs("menu");
        if (passedData.firstLoad)
        {
            passedData.defaults(musicAssets.crt1Kit, "knight", playerAssets.knight_desc, musicAssets.crt1Kit.desc, "prac");
        }
        menuScript.init(passedData, musicPlayer, musicAssets, playerAssets);
        musicPlayer.init(passedData.p1Kit, passedData.p2Kit, "menu", passedData.musicVolume);
    }
    public void initFight()
    {
        setRefs("fight");
        UnityEngine.Cursor.lockState = CursorLockMode.Confined;
        activescene = SceneManager.GetActiveScene();
        UnityEngine.Cursor.visible = false;
        mapLoader.loadMap(passedData.map);
        weaponLoader.spawnPositions = spawnPositions;
        resetFight();
        p1Wins = 0;
        p2Wins = 0;
    }
    private void resetFight()
    {
        fightUi.set(passedData, p1Wins, p2Wins, 60);
        musicPlayer.init(passedData.p1Kit, passedData.p2Kit, "fight", passedData.musicVolume);
        healthbarP1.set("p1", passedData.map);
        healthbarP2.set("p2", passedData.map);
        if (passedData.map == "prac")
        {
            initPlayers(new string[] { passedData.p1Skin, passedData.p2Skin }, spawnPositions.prac_player, 200);//passeddata
        }
        else if (passedData.map == "ham")
        {
            initPlayers(new string[] { passedData.p1Skin, passedData.p2Skin }, spawnPositions.ham_player, 200);//passeddata
        }
        else if (passedData.map == "jap")
        {
            initPlayers(new string[] { passedData.p1Skin, passedData.p2Skin }, spawnPositions.jap_player, 200);//passeddata
        }
        weaponLoader.set(passedData.map);
    }
    private void initPlayers(string[] playerskins, Vector2 spawnAt, int health)
    {
        //devices assign
        if (passedData.p1Gamepad == null)//p1 mouse+keyboard
        {
            Debug.Log("case: p1 keyboardMouse");
            player1.GetComponent<PlayerInput>().SwitchCurrentControlScheme(new InputDevice[2] { Keyboard.current, Mouse.current });
        }
        else//p1 gamepad
        {
            Debug.Log("case: p1 gamepad");
            player1.GetComponent<PlayerInput>().SwitchCurrentControlScheme(passedData.p1Gamepad);
        }

        if (passedData.p2Gamepad != null)//p2 gamepad
        {
            Debug.Log("case: p2 gamepad");
            player2.GetComponent<PlayerInput>().SwitchCurrentControlScheme(passedData.p2Gamepad);
        }
        else//p2 no device
        {
            Debug.Log("case: p2 nothing");
            player2.GetComponent<PlayerInput>().SwitchCurrentControlScheme("Gamepad", Mouse.current);
        }

        //player
        player1.GetComponent<playerController>().init(playerskins[0], spawnAt, health, playerAssets, new Vector2(1, 0));
        player2.GetComponent<playerController>().init(playerskins[1], spawnAt * new Vector3(-1, 1), health, playerAssets, new Vector2(-1, 0));
    }
    private void setRefs(string scene)//find called once
    {
        unset();//drop all references
        passedData = GameObject.FindGameObjectWithTag("passedData").GetComponent<passedData>();//search for passedData
        if (scene == "menu")//menu
        {
            menuRefs menuRefs = GameObject.FindGameObjectWithTag("refHandler").GetComponent<menuRefs>();
            //initMenu fetch
            menuScript = menuRefs.menuScript;
            musicPlayer = menuRefs.musicPlayer;

        }
        else if (scene == "fight")//fight
        {
            fightRefs fightRefs = GameObject.FindGameObjectWithTag("refHandler").GetComponent<fightRefs>();
            //initFight fetch
            healthbarP1 = fightRefs.healthbarP1;
            healthbarP2 = fightRefs.healthbarP2;
            player1 = fightRefs.player1;
            player2 = fightRefs.player2;
            fightUi = fightRefs.fightUi;
            musicPlayer = fightRefs.musicPlayer;
            mapLoader.init(fightRefs);//junking it for less lines
        }
    }
    private void unset()
    {
        //unset fight refs
        healthbarP1 = null;
        healthbarP2 = null;
        player1 = null;
        player2 = null;

        //unset menu refs
        menuScript = null;

        //musicplayer
        musicPlayer = null;

        //common refs
        //we don't unset common refs
    }
}