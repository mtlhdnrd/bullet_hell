using JetBrains.Annotations;
using System;
using System.Collections;
using System.Collections.Generic;
using Unity.Mathematics;
using UnityEngine;
using UnityEngine.UIElements;

public class playerHealth : MonoBehaviour
{
    public int currentHealth;
    public healthbar healthbarScript;
    public List<GameObject> inkFx;


    //player gets damaged
    public void playerDamaged(int dmg, string type)
    {
        if (currentHealth > 0)
        {
            currentHealth -= dmg;
            healthbarScript.healthUpdate(currentHealth);
            damageFx(type);
        }
        else { death(); }

    }

    private void damageFx(string type)
    {
        if (type == "ink" && inkFx.Count>0)
        {
            Instantiate(inkFx[UnityEngine.Random.Range(0, inkFx.Count)], this.gameObject.transform.position, Quaternion.Euler(0, 0, 0));
        }
    }

    public void death()
    {
        Debug.Log(gameObject.name + "is dead");
    }

    public void init(int health, playerAssets playerAssets)
    {
        currentHealth = health;
        inkFx = playerAssets.ink_damageFx;
    }
}
