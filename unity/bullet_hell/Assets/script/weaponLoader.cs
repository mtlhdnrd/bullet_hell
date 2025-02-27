using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class weaponLoader : MonoBehaviour {
    public GameObject shotgun;
    public spawnPositions spawnPositions;

    private void mirror(GameObject weapon, Vector2 spawnAt) {
        Instantiate(weapon, spawnAt, Quaternion.Euler(0, 0, 0)).name += "1";
        Instantiate(weapon, new Vector2(-spawnAt.x, spawnAt.y), Quaternion.Euler(0, 180, 0)).name += "2";
    }

    public void init(string mapname) {
        foreach(GameObject weapon in GameObject.FindGameObjectsWithTag("weapon")) {
            Destroy(weapon);
            Debug.Log(weapon.name + " destroyed");
        }

        if(mapname == "ham") {
            mirror(shotgun, new Vector2(spawnPositions.ham_rare1.x, spawnPositions.ham_rare1.y));
        } else if(mapname == "prac") {
            mirror(shotgun, new Vector2(spawnPositions.prac_rare1.x, spawnPositions.prac_rare1.y));
        } else if(mapname == "jap") {
            mirror(shotgun, new Vector2(spawnPositions.jap_rare1.x, spawnPositions.jap_rare1.y));
        }
        Debug.Log(mapname + "loaded");
    }

}
