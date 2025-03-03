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
    
    private void testData()
    {
        p1Name = "BH1";
        p2Name = "BH2";
        //p1Kit = musicAssets.crt1Kit;
        //hardcoded even more
        //p2Kit = musicAssets.hellstarKit;
        p1Skin = "butcher";
        p2Skin = "bull";
        map="prac";
    }

    void Awake()
    {
        
        GameObject[] objs = GameObject.FindGameObjectsWithTag("passedData");

        if (objs.Length > 1)
        {
            Destroy(this.gameObject);
        }

        testData();

        DontDestroyOnLoad(this.gameObject);
    }
}
