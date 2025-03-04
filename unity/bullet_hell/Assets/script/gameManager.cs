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
using UnityEngine.Rendering.Universal;

public class gameManager : MonoBehaviour
{
<<<<<<< HEAD
    [Header("fight refs")]//fetched on initFight
    public healthbar healthbarP1;
    public healthbar healthbarP2;
=======
    [Header("script refs")]
    public mapLoader mapLoader;
    public weaponLoader weaponLoader;
    public spawnPositions spawnPositions;
    public healthbar healthbarP1;
    public healthbar healthbarP2;
    public uiHandler uiHandler;
    public playerAssets playerAssets;
    public musicPlayer musicPlayer;
    public musicAssets musicAssets;
    public passedData passedData;
    //passedData passedData;

    [Header("gameobject refs")]
>>>>>>> aa0f745674afcbe28844bee6df24bb8b62d6af70
    public GameObject player1;
    public GameObject player2;
    public fightUi fightUi;
    //+mapLoader dependency on init

    [Header("menu refs")]//fetched on menuInit
    public menu menuScript;

<<<<<<< HEAD
    [Header("common refs")]//fetched on both
    public musicPlayer musicPlayer;

    [Header("permanent refs")]//fetched on awake, or hardcoded from UI
    public mapLoader mapLoader;
    public passedData passedData;
    public weaponLoader weaponLoader;
    public spawnPositions spawnPositions;
    public playerAssets playerAssets;
    public musicAssets musicAssets;

    [Header("logs")]
    public bool firstLaunch;

    private void Awake()
    {
        firstLaunch = true;
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void OnSceneLoaded(Scene scene, LoadSceneMode arg1)
    {

        Debug.Log("scene loaded:" + scene.name);

        if (scene.name == "Menu")
        {
            initMenu();
        }
        else if (scene.name == "Game")
        {
            initFight();
        }

    }

    public void initMenu()
    {
        setRefs("Menu");
        menuScript.init(passedData);
    }

    public void initFight()
    {
        setRefs("Fight");
        mapLoader.loadMap(passedData.map);
        weaponLoader.spawnPositions = spawnPositions;
        musicPlayer.init(passedData.p1Kit, passedData.p2Kit, 0.5f, "fight");
        fightUi.init(passedData);
        healthbarP1.init("p1", passedData.map);
        healthbarP2.init("p2", passedData.map);
        UnityEngine.Cursor.visible = false;
        UnityEngine.Cursor.lockState = CursorLockMode.Confined;

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
        weaponLoader.init(passedData.map);
    }

    private void initPlayers(string[] playerskins, Vector2 spawnAt, int health)
    {
        player1.GetComponent<playerController>().init(playerskins[0], spawnAt, health, playerAssets);
        player2.GetComponent<playerController>().init(playerskins[1], spawnAt * new Vector3(-1, 1), health, playerAssets);
    }

    private void setRefs(string scene)//find called once
    {
        unset();
        if (scene == "Menu")//menu
        {
            menuRefs menuRefs = GameObject.FindGameObjectWithTag("refHandler").GetComponent<menuRefs>();
            //initMenu fetch
            menuScript = menuRefs.menuScript;
        }
        else//fight
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
=======
    public void init(string mapName)
    {
        
        Cursor.lockState = CursorLockMode.Confined;
        musicPlayer.init(passedData.p1Kit, passedData.p2Kit, 0.5f, "fight");//passeddata
        mapLoader.loadMap(mapName);//passeddata
        healthbarP1.init("p1", mapName);//passeddata
        healthbarP2.init("p2", mapName);//passeddata
        uiHandler.init(new string[] { passedData.p1Name, "200RP" });//passeddata

        if (mapName == "prac")
        {
            //initplayers' skin will be controlled by passedData
            initPlayers(new string[] { passedData.p1Skin, passedData.p2Skin }, spawnPositions.prac_player, 200);//passeddata
            weaponLoader.init(mapName);
>>>>>>> aa0f745674afcbe28844bee6df24bb8b62d6af70
        }
        else if (mapName == "ham")
        {
            initPlayers(new string[] { passedData.p1Skin, passedData.p2Skin }, spawnPositions.ham_player, 200);//passeddata
            weaponLoader.init(mapName);
        }
        else if (mapName == "jap")
        {
            initPlayers(new string[] { passedData.p1Skin, passedData.p2Skin }, spawnPositions.jap_player, 200);//passeddata
            weaponLoader.init(mapName);
        }
        Debug.Log(passedData.test);
        Debug.Log(passedData.test);
        Debug.Log(passedData.test);
        Debug.Log(passedData.test);
    }

<<<<<<< HEAD
    private void unset()
    {
        //unset fight refs
        healthbarP1 = null;
        healthbarP2 = null;
        player1 = null;
        player2 = null;
=======
    private void initPlayers(string[] playerskins, Vector2 spawnAt, int health)
    {
        player1.GetComponent<playerController>().init(playerskins[0], spawnAt, health, playerAssets);
        player2.GetComponent<playerController>().init(playerskins[1], spawnAt * new Vector3(-1, 1), health, playerAssets);
    }

    private void baseSettings()
    {
        passedData = GameObject.FindGameObjectWithTag("passedData").GetComponent<passedData>();
        Cursor.visible = false;
        weaponLoader.spawnPositions = spawnPositions;
    }
>>>>>>> aa0f745674afcbe28844bee6df24bb8b62d6af70

        //unset menu refs
        menuScript = null;

<<<<<<< HEAD
        //musicplayer
        musicPlayer = null;

        //common refs
        //we don't unset common refs
=======
    //this should initialize every single component instead of them doing themselves -> easy reset per round, controllable awake and init functions by passing data from last round/menu
    private void Awake()
    {
        baseSettings();
        init(passedData.map);
>>>>>>> aa0f745674afcbe28844bee6df24bb8b62d6af70
    }
}
