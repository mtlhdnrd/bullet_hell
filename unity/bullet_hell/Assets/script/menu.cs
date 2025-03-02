using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.UIElements;

public class menu : MonoBehaviour
{
    string player1;
    string player2;

    enum Players
    {
        Player1,
        Player2,
    }

    public void matchmake()
    {
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
}
