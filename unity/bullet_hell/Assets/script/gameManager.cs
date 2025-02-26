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
    public uiHandler uiHandler;
    //passedData passedData;

    [Header("gameobject refs")]
    public GameObject player1;
    //public GameObject player2;



    private void initPlayers(string[] playerskins, Vector2 spawnAt, int health)
    {
        //player1
        player1.GetComponent<playerController>().init(playerskins[0], spawnAt, health);//position needs rewriting on a per-map basis
        //player2 goes here
    }

    public void initTest(string mapName)
    {
        mapLoader.loadMap(mapName);
        healthbarP1.init("p1", mapName);
        uiHandler.init(new string[] { "batyuzo","200RP"});

        if (mapName == "prac")
        {
            //initplayers' skin will be controlled by passedData
            initPlayers(new string[] { "entity", null }, spawnPositions.prac_player, 200);
            weaponLoader.init(mapName);
        }
        else if (mapName == "ham")
        {
            initPlayers(new string[] { "butcher", null }, spawnPositions.ham_player, 200);
            weaponLoader.init(mapName);
        }
        else if (mapName == "jap")
        {
            initPlayers(new string[] { "rogue", null }, spawnPositions.jap_player, 200);
            weaponLoader.init(mapName);
        }


    }

    private void baseSettings()
    {
        Cursor.visible = false;
        weaponLoader.spawnPositions = spawnPositions;
    }


    //this should initialize every single component instead of them doing themselves -> easy reset per round, controllable awake and init functions by passing data from last round/menu
    private void Awake()
    {
        baseSettings();
        initTest("jap");
    }
}
