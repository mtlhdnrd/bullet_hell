using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class weaponLoader : MonoBehaviour
{
    [Header("weapon refs")]
    //---SLAUGHTERHOUSE WEAPONS---
    [SerializeField] GameObject death;//ham, unique
    [SerializeField] GameObject nailgun;//ham, rare
    [SerializeField] GameObject chainsaw;//ham, rare
    [SerializeField] GameObject cleaver;//ham, common
    [SerializeField] GameObject knife;//ham, common
    [SerializeField] GameObject taser;//ham, common

    //---PRACTICE WEAPONS---
    //[SerializeField] GameObject pow;//unique
    [SerializeField] GameObject cyclops;//unique
    //[SerializeField] GameObject switchrifle;//unique
    //[SerializeField] GameObject ak;//rare
    //[SerializeField] GameObject mp40;//rare
    //[SerializeField] GameObject blitzwerfer;//rare
    //[SerializeField] GameObject ebow;//rare
    [SerializeField] GameObject shotgun;//rare
    [SerializeField] GameObject pistol;//common
    //[SerializeField] GameObject revolver;//common
    //[SerializeField] GameObject ebaton;//common
    //[SerializeField] GameObject esmg;//common
    //[SerializeField] GameObject epistol;//common
    //[SerializeField] GameObject molotov;//common

    //---PALACE OF THE SETTING SUN WEAPONS---
    [SerializeField] GameObject nobunaga;//unique
    //[SerializeField] GameObject bow;//rare
    [SerializeField] GameObject katana;//rare
    //[SerializeField] GameObject kusarigama;//rare
    //[SerializeField] GameObject kunai;//common
    [SerializeField] GameObject dagger;//common

    [Header("script refs")]
    public spawnPositions spawnPositions;

    [Header("logs")]
    [SerializeField] int weaponsSpawned;
    public void set(string mapname)//called by gameManager
    {
        weaponsSpawned = 0;
        //destroy past weapons
        foreach (GameObject weapon in GameObject.FindGameObjectsWithTag("weapon"))
        {
            Destroy(weapon);
        }

        //spawn new weapons
        if (mapname == "ham")
        {
            //weapons get spawned
            //1 - unique
            //2 - rare
            //3 - common
            spawnWeapons(new List<GameObject>() { death }, new List<GameObject>() { nailgun, chainsaw }, new List<GameObject>() { cleaver, knife, taser }, spawnPositions.ham_unique, spawnPositions.ham_rare, spawnPositions.ham_common1, spawnPositions.ham_common2);
        }
        else if (mapname == "prac")
        {
            //rarities filled
            //weapons get spawned
            //1 - unique
            //2 - rare
            //3 - common
            //spawnWeapons(new List<GameObject>() { cyclops, death, nobunaga }, new List<GameObject>() { shotgun, chainsaw, katana }, new List<GameObject>() { pistol, nailgun, cleaver, knife, taser }, spawnPositions.prac_unique, spawnPositions.prac_rare, spawnPositions.prac_common1, spawnPositions.prac_common2);

            //debug version
            spawnWeapons(new List<GameObject>() { cyclops }, new List<GameObject>() { chainsaw }, new List<GameObject>() { dagger }, spawnPositions.prac_unique, spawnPositions.prac_rare, spawnPositions.prac_common1, spawnPositions.prac_common2);
        }
        else if (mapname == "jap")
        {
            //weapons get spawned
            //1 - unique
            //2 - rare
            //3 - common
            spawnWeapons(new List<GameObject>() { nobunaga }, new List<GameObject>() { katana }, new List<GameObject>() { dagger }, spawnPositions.jap_unique, spawnPositions.jap_rare, spawnPositions.jap_common1, spawnPositions.jap_common2);
        }
        Debug.Log(mapname + "loaded");
    }
    private void spawnWeapons(List<GameObject> unique, List<GameObject> rare, List<GameObject> common, Vector2 uniquePos, Vector2 rare1Pos, Vector2 common1Pos, Vector2 common2Pos)
    {
        //UNIQUE
        single(unique[Random.Range(0, unique.Count)], uniquePos);
        //RARE
        mirror(rare[Random.Range(0, rare.Count)], rare1Pos);
        //COMMON
        mirror(common[Random.Range(0, common.Count)], common1Pos);
        mirror(common[Random.Range(0, common.Count)], common2Pos);
    }
    private void single(GameObject weapon, Vector2 spawnAt)//spawn per side
    {
        Instantiate(weapon, spawnAt, Quaternion.Euler(0, 180 * Random.Range(0, 1), 0)).name = weaponsSpawned + weapon.name;
        weaponsSpawned++;
    }
    private void mirror(GameObject weapon, Vector2 spawnAt)//spawn per side
    {
        Instantiate(weapon, spawnAt, Quaternion.Euler(0, 0, 0)).name = weaponsSpawned + weapon.name;
        weaponsSpawned++;
        Instantiate(weapon, new Vector2(-spawnAt.x, spawnAt.y), Quaternion.Euler(0, 180, 0)).name = weaponsSpawned + weapon.name;
        weaponsSpawned++;
    }
}