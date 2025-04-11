using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;

public class taser : weapon
{
    [Header("dependencies")]
    public meleeCheck meleeCheck;
    public Sprite used;
    public SpriteRenderer weaponRenderer;
    public muzzleFlash muzzleFlash;
    
    public override void Fire()
    {
        //firing happens
        if (cooldown <= 0 && magazine > 0)
        {
            magazine--;
            cooldown = 60 / firerate;
            //GetComponent<AudioSource>().Play();

            //---MUZZLE FLASH---
            Instantiate(muzzleFlash, transform.position, transform.rotation);

            //---ANIMATION---
            weaponRenderer.sprite = used;

            if (meleeCheck.getColl() != null)
            {
                meleeCheck.getColl().GetComponent<playerHealth>().playerDamaged(damage, "zap");
                meleeCheck.getColl().GetComponent<playerController>().speed = meleeCheck.getColl().GetComponent<playerController>().speed / 2;
                meleeCheck.getColl().GetComponent<playerController>().jumpingPower = meleeCheck.getColl().GetComponent<playerController>().jumpingPower / 2;
                meleeCheck.getColl().GetComponentInChildren<gunHolder>().Drop();
            }
        }
    }
    public override void AltFire()
    {
        base.AltFire();
    }
    public override void flip(bool flip)
    {
        base.flip(flip);
        meleeCheck.flip(flip);
    }
    public override void equip(GameObject parent)
    {
        base.equip(parent);
        meleeCheck.ignore(parent);
    }
    public override void FixedUpdate()
    {
        base.FixedUpdate();
        frame++;
        if (frame > 1000)
        {
            frame = 0;
        }
    }
}