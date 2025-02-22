using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class shotgun : weapon
{
    public override void Fire()
    {
        if (cooldown <= 0 && magazine>0)//firing happens
        {
            cooldown = 1 / firerate;
            magazine--;
            Debug.Log("*pow*, rounds left: " + magazine);
        }
        else//firing doesn't happen
        {
            //play click sound
            Debug.Log("*click*");
        }
    }

    public override void AltFire()
    {
        GameObject.Find("gameManager").GetComponent<gameManager>().initTest("ham_factory");
    }

    public override void SetValues()
    {
        handCloseOffset = new float[] { 0, 0, 53 };
        handFarOffset = new float[] { -0.863f, -0.162f, 0 };
        weaponOffset = new float[] { -0.446f, -0.061f, 0 };
    }

    private void Awake()
    {
        gameObject.layer = 8;
        magazine = 7;
        rarity = 2;
        ranged = true;
        damage = 15;
        firerate = 0.75f;
        projSpeed = .85f;
    }
}
