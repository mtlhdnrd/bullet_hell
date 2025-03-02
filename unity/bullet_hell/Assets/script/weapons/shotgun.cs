using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class shotgun : weapon
{

    [Header("bullet refs")]
    public GameObject shootingPoint;
    public muzzleFlash muzzleFlash;
    public GameObject bullet;
    public override void Fire()
    {
        //firing happens
        if (cooldown <= 0 && magazine > 0)
        {
            cooldown = 1 / firerate;
            magazine--;
            GetComponentInParent<playerHealth>().playerDamaged(damage);
            //GetComponent<AudioSource>().Play();
            muzzleFlash.playAnim();
            Debug.Log("*pow*, rounds left: " + magazine);
            Debug.Log("you shot yourself, idiot, hp left:" + GetComponentInParent<playerHealth>().currentHealth);
            //firing doesn't happen
        }
        else
        {
            //play click sound
            Debug.Log("*click*");
        }
    }

    public override void AltFire()
    {
        GameObject.Find("gameManager").GetComponent<gameManager>().initTest("ham");
    }

    public override void SetValues()
    {
        handCloseOffset = new float[] { 0, 0, 53 };
        handFarOffset = new float[] { -0.863f, -0.162f, 0 };
        weaponOffset = new float[] { -0.446f, -0.061f, 0 };
    }

    private void Awake()
    {
        weaponName = "shotgun";
        weaponHands = new char[] { 'a', 'a' };
        gameObject.layer = 8;
        magazine = 7;
        rarity = 2;
        ranged = true;
        damage = 15;
        firerate = 0.75f;
        projSpeed = .85f;
    }
}
