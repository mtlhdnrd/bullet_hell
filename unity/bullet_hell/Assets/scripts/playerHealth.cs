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
    public List<GameObject> zapFx;
    public bool dead;
    public List<float> dmgReceived;

    public void init(int health, playerAssets playerAssets)
    {
        dead = false;
        currentHealth = health;
        inkFx = playerAssets.ink_damageFx;
        zapFx = playerAssets.zap_damageFx;
    }

    //player gets damaged
    public void playerDamaged(int dmg, string type)
    {
        if (currentHealth > 0)
        {
            dmgReceived.Add(dmg);
            currentHealth -= dmg;
            healthbarScript.healthUpdate(currentHealth);
            damageFx(type);
            if (currentHealth <= 0)
            {
                death();
            }
        }
    }

    private void damageFx(string type)
    {
        if (type == "ink" && inkFx.Count > 0)
        {
            Instantiate(inkFx[UnityEngine.Random.Range(0, inkFx.Count)], this.gameObject.transform.position, Quaternion.Euler(0, 0, 0));
        }
        if (type == "zap" && inkFx.Count > 0)
        {
            Instantiate(zapFx[UnityEngine.Random.Range(0, zapFx.Count)], this.gameObject.transform.position, Quaternion.Euler(0, 0, 0));
        }
    }

    public void death()
    {
        dead = true;
        Debug.Log(gameObject.name + "is dead");
    }


}
