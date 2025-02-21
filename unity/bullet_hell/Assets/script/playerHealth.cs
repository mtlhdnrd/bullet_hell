using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerHealth : MonoBehaviour
{
    public int currentHealth;

    //player gets damaged
    public void playerDamaged(int dmg)
    {
        if (currentHealth > 0)
        {
            currentHealth -= dmg;
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
