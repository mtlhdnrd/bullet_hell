using JetBrains.Annotations;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Rendering;

public class passedData : MonoBehaviour
{
    public bool p1Login;
    public bool p2Login;
    public string p1Name;
    public string p2Name;
    public musicKit p1Kit;
    public musicKit p2Kit;
    public string p1Skin;
    public string p2Skin;
    public int p1Rank;
    public int p2Rank;
    public string map;
    public List<string> p1Skins;
    public List<string> p2Skins;
    public List<musicKit> p1Kits;
    public List<musicKit> p2Kits;
    public InputActionAsset p1Controls;
    public InputActionAsset p2Controls;
    public InputDevice p1Gamepad;
    public InputDevice p2Gamepad;
    public bool firstLoad;
    public List<string> drops;//playerID, itemname
    public float musicVolume;
    public bool devMode;

    void Awake()
    {
        GameObject[] objs = GameObject.FindGameObjectsWithTag("passedData");
        if (objs.Length > 1)
        {
            Destroy(this.gameObject);
        }
        DontDestroyOnLoad(this.gameObject);
    }
    public void defaults(musicKit defaultKit, string defaultSkin, string defaultSkinDesc, string defaultKitDefs, string defaultMap)
    {
        p1Login = false;
        p2Login = false;
        //names default
        p1Name = "p1";
        p2Name = "p2";
        //kits default
        p1Kit = defaultKit;
        p2Kit = defaultKit;
        //zero ranks
        p1Rank = 0;
        p2Rank = 0;
        //skin defaults
        p1Skin = defaultSkin;
        p2Skin = defaultSkin;
        //map default
        map = defaultMap;//if matchmake dies
        //cut outside dependencies
        devMode = false;
    }
}
