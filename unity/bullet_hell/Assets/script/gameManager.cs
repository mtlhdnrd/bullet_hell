using JetBrains.Annotations;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class gameManager : MonoBehaviour
{
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
    public GameObject player1;
    public GameObject player2;


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


    //this should initialize every single component instead of them doing themselves -> easy reset per round, controllable awake and init functions by passing data from last round/menu
    private void Awake()
    {
        baseSettings();
        init(passedData.map);
    }
}
