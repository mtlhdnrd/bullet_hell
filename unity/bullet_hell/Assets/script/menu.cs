using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.UIElements;

public class menu : MonoBehaviour
{
    public passedData passedData;
    string player1;
    string player2;
    public musicPlayer musicPlayer;

    public List<string> maps;

    enum Players
    {
        Player1,
        Player2,
    }

    public void init(passedData passedDataRef)
    {
        passedData = passedDataRef;
    }

    public void matchmake()
    {
        passedData.map = maps[Random.Range(0, maps.Count)];
        SceneManager.LoadScene("Game");

    }

    public void LoginPlayer1()
    {
        Login(Players.Player1);
        //set player name here
        //set player rank here
        passedData.p1Name = "batyuzo";
        passedData.p1Skin = "bull";
        
    }

    public void LoginPlayer2()
    {
        Login(Players.Player2);
        //set player name here
        //set player rank here
        passedData.p2Name = "girmany";
        passedData.p2Skin = "rogue";


    }

    void Login(Players player)
    {
        switch (player)
        {
            case Players.Player1:
                player1 = "batyuzo";
                break;
            case Players.Player2:
                player2 = "gizmo";
                break;

            //will not happen, can't guarrantee in c# that i've exhausted the cases
            default:
                break;
        }

        if (player1 != null && player2 != null)
        {
            GameObject.Find("btn_matchmake").GetComponent<UnityEngine.UI.Button>().interactable = true;
        }
    }

    public void quit()
    {
        Application.Quit();
    }
}
