using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class fightLight : MonoBehaviour
{
    [Header("sprite refs")]
    [SerializeField] Sprite red;
    [SerializeField] Sprite blue;
    [SerializeField] Sprite pink;
    [SerializeField] Sprite lightOff;
    [Header("renderer refs")]
    [SerializeField] SpriteRenderer currentLight;
    public void on(string map)//gameManager fight init
    {
        if (map=="ham")
        {
            currentLight.sprite = red;
        }
        else if (map == "jap")
        {
            currentLight.sprite = pink;
        }
        else if (map == "prac")
        {
            currentLight.sprite = blue;
        }
    }
    public void off()//gameManager fight init
    {
        currentLight.sprite = lightOff;
    }
}
