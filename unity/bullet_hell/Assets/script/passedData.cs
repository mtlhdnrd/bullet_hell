using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class passedData : MonoBehaviour
{
    public string test ="test";
    public string p1Name;
    public string p2Name;
    public musicKit p1Kit;
    public musicKit p2Kit;
    public string p1Skin;
    public string p2Skin;
    public string map;
    
    private void defaults()
    {
        p1Name = "batyuzo";
        p2Name = "gizmo";
        //p1Kit = musicAssets.crt1Kit;
        //p2Kit = musicAssets.hellstarKit;
        p1Skin = "knight";
        p2Skin = "knight";
        map="prac";
    }

    void Awake()
    {
        GameObject[] objs = GameObject.FindGameObjectsWithTag("passedData");
        if (objs.Length > 1)
        {
            Destroy(this.gameObject);
        }
        DontDestroyOnLoad(this.gameObject);
        defaults();
    }
}
