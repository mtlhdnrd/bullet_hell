using JetBrains.Annotations;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class gameManager : MonoBehaviour
{
    [Header("refs")]
    public mapLoader mapLoader;
    public weaponLoader weaponLoader;
    public spawnPositions spawnPositions;
    public healthbar healthbarP1;
    //passedData passedData;

    public GameObject player1;
    //public GameObject player2;



    private void initPlayers(string[] playerskins, Vector2 spawnAt, int health)
    {
        //player1
        player1.GetComponent<playerController>().init(playerskins[0], spawnAt, health);//position needs rewriting on a per-map basis
        //player2 goes here
    }

    public void initTest(string mapname)
    {
        mapLoader.loadMap(mapname);
        healthbarP1.init("p1");

        if (mapname == "prac")
        {
            //initplayers' skin will be controlled by passedData
            initPlayers(new string[] { "entity", null }, spawnPositions.prac_player, 200);
            weaponLoader.init(mapname);
        }
        else if (mapname == "ham")
        {
            initPlayers(new string[] { "butcher", null }, spawnPositions.ham_player, 200);
            weaponLoader.init(mapname);
        }
        else if (mapname == "jap")
        {
            initPlayers(new string[] { "rogue", null }, spawnPositions.jap_player, 200);
            weaponLoader.init(mapname);
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
