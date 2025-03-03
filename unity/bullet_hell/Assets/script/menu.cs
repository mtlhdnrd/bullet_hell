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

    public void matchmake()
    {
        passedData.test = "passedData works";
        passedData.map = maps[Random.Range(0, maps.Count)];
        SceneManager.LoadScene("Game");
    }

    public void LoginPlayer1()
    {
        Login(Players.Player1);
    }

    public void LoginPlayer2()
    {
        Login(Players.Player2);
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

    private void Awake()
    {
        maps =new List<string>{"prac", "ham", "jap"};
        passedData = GameObject.FindGameObjectWithTag("passedData").GetComponent<passedData>();//because it may or may not destroy itself on load
        musicPlayer.init(passedData.p1Kit, passedData.p2Kit, 0.5f, "menu");//passeddata
    }
}
