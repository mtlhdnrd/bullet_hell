using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerHealth : MonoBehaviour
{
    public int currentHealth;
    public healthbar healthbarScript;

    //player gets damaged
    public void playerDamaged(int dmg)
    {
        if (currentHealth > 0)
        {
            currentHealth -= dmg;
            healthbarScript.healthUpdate("p1",currentHealth);
        }

        else { death(); }

    }

    public void death()
    {
        Debug.Log(gameObject.name + "is dead");
    }

    public void Update()
    {
    }
}
