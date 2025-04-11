using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using UnityEngine;

public class lootGiver : MonoBehaviour
{
    [Header("refs")]
    public passedData passedData;

    public List<string> allSkins = new List<string> { "bull", "butcher", "knight", "entity", "rogue", "samurai" };
    public List<string> allMusic = new List<string> { "Dusqk", "CRT_HEAD1", "CRT_HEAD2", "hellstar plus", "Mute City" };
    public List<string> available = new List<string>();

    //called by gameManager
    public string getSkinReward(string player, string map, passedData passedDataRef)
    {
        passedData = passedDataRef;
        string temp = null;
        //available = all-unowned
        if (player == "p1")
        {
            Debug.Log("Allskins: " + allSkins[0]);
            Debug.Log("p1ksins: " + passedData.p1Skins[0]);
            determine(allSkins, passedData.p1Skins);//available changed            
        }
        else if (player == "p2")
        {
            determine(allSkins, passedData.p2Skins);//available changed            
        }
        //everything is owned
        if (available.Count < 1)
        {
            return null;
        }
        //rewards per map
        if (map == "ham")
        {
            temp = randSelect("bull", "butcher");
            if (temp != null) { return temp; }
        }
        else if (map == "prac")
        {
            temp = randSelect("knight", "entity");
            if (temp != null) { return temp; }
        }
        else if (map == "jap")
        {
            temp = randSelect("rogue", "samurai");
            if (temp != null) { return temp; }
        }
        //all mapItems owned
        return available[Random.Range(0, available.Count)];
    }
    public string getMusicReward(string player, string map, passedData passedDataRef)
    {
        passedData = passedDataRef;
        //available = all-unowned
        if (player == "p1")
        {
            determine(allMusic, kitsConvert(passedData.p1Kits));//available changed            
        }
        else if (player == "p2")
        {
            determine(allMusic, kitsConvert(passedData.p2Kits));//available changed            
        }
        //everything is owned
        if (available.Count < 1)
        {
            return null;
        }
        //rewards per map
        if (map == "ham")
        {
            if (available.Contains("CRT_HEAD2")) { return "CRT_HEAD2"; }
        }
        else if (map == "prac")
        {
            if (available.Contains("hellstar plus")) { return "hellstar plus"; }
        }
        else if (map == "jap")
        {
            if (available.Contains("Mute City")) { return "Mute City"; }
        }
        //all mapItems owned
        return available[Random.Range(0, available.Count)];
    }
    //internal functions
    private void determine(List<string> all, List<string> owned)//all.remove(owned)
    {
        available = new List<string>();
        foreach (string item in all)
        {
            if (!owned.Contains(item))
            {
                available.Add(item);
            }
        }
    }
    private string randSelect(string a, string b)
    {
        if (Random.Range(0, 2) == 0)
        {
            if (available.Contains(a)) { return a; }
            if (available.Contains(b)) { return b; }
        }
        else
        {
            if (available.Contains(b)) { return b; }
            if (available.Contains(a)) { return a; }
        }
        return null;
    }
    private List<string> kitsConvert(List<musicKit> toConvert)
    {
        List<string> musicOwned = new List<string>();
        Debug.Log(toConvert.ToString());
        foreach (musicKit kit in toConvert)
        {
            if (kit.name == "Dusqk")
            {
                musicOwned.Add("Dusqk");
            }
            else if (kit.name == "CRT_HEAD1")
            {
                musicOwned.Add("CRT_HEAD1");
            }
            else if (kit.name == "CRT_HEAD2")
            {
                musicOwned.Add("CRT_HEAD2");
            }
            else if (kit.name == "hellstar plus")
            {
                musicOwned.Add("hellstar plus");
            }
            else if (kit.name == "Mute City")
            {
                musicOwned.Add("Mute City");
            }
        }
        return musicOwned;
    }
}