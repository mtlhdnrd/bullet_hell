using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Rendering.Universal.Internal;
using UnityEngine.UIElements;

public class fightUi : MonoBehaviour
{
    public GameObject[] refsP1;
    public GameObject[] refsP2;
    public fightLight light1P1;
    public fightLight light2P1;
    public fightLight light1P2;
    public fightLight light2P2;

    public TextMeshProUGUI timer;

    public float timeLeft;//in seconds

    private void FixedUpdate()
    {
        timeLeft = timeLeft - (1f / 60f);
        updateClock();
    }

    //1st = name
    //2nd = rank
    //3rd = weapon
    public void set(passedData passedData, int lightsP1, int lightsP2, float time)
    {

        //p1 ui elements
        refsP1[0].GetComponent<TextMeshProUGUI>().SetText(passedData.p1Name);
        refsP1[1].GetComponent<TextMeshProUGUI>().SetText(passedData.p1Rank.ToString() + "RP");
        refsP1[2].GetComponent<TextMeshProUGUI>().SetText("bare hands");

        //p2 ui elements
        refsP2[0].GetComponent<TextMeshProUGUI>().SetText(passedData.p2Name);
        refsP2[1].GetComponent<TextMeshProUGUI>().SetText(passedData.p2Rank.ToString() + "RP");
        refsP2[2].GetComponent<TextMeshProUGUI>().SetText("bare hands");

        //lights
        lightSet(passedData.map, lightsP1, lightsP2);

        //timer
        timeLeft = time;
    }
    public void lightSet(string map, int winsP1, int winsP2)
    {
        light1P1.off();
        light1P2.off();
        light2P1.off();
        light2P2.off();

        //p1 lights
        if (winsP1 > 0)
        {
            light1P1.on(map);
        }
        if (winsP1 > 1)
        {
            light2P1.on(map);
        }
        //p2 lights
        if (winsP2 > 0)
        {
            light1P2.on(map);
        }
        if (winsP2 > 1)
        {
            light2P2.on(map);
        }
    }
    private void updateClock()
    {
        timer.text = Convert.ToInt32(timeLeft).ToString();
    }
}