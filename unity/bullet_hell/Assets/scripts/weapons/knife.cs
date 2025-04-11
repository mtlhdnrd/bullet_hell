using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;

public class knife : weapon
{
    [Header("dependencies")]
    public meleeCheck meleeCheck;
    public List<GameObject> collisionWith;
    public meleeTrail trail;
    public Sprite clean;
    public Sprite ink;
    public SpriteRenderer weaponRenderer;

    [Header("logs n settings")]
    public bool check;
    public bool projectileMode;
    private int current;//current frame
    private int animDuration;

    public override void Fire()
    {
        //firing happens
        if (cooldown <= 0 && magazine > 0)
        {
            check = true;
            cooldown = 60 / firerate;
            //GetComponent<AudioSource>().Play();

            //ANIMATION
            current = 0;
            animDuration = weaponAnim.Count;
        }
    }
    public override void AltFire()
    {
        base.AltFire();
        projectileMode = true;
    }
    private void swing()
    {
        if (animDuration > 0)
        {
            if (animDuration > 0 && frame % 4 == 0)//15fps
            {
                animDuration--;
                if (flipped)
                {
                    weaponAnimCurrent = weaponAnim[current];
                }
                else
                {
                    weaponAnimCurrent = new Vector3(weaponAnim[current].x, -weaponAnim[current].y, -weaponAnim[current].z);
                }
                current++;
            }
        }
        else
        {
            trail.on(false);
            weaponAnimCurrent = Vector3.zero;
        }
        if (animDuration == 3 && check)
        {
            trail.on(true);
            if (meleeCheck.getColl() != null)
            {
                check = false;
                meleeCheck.getColl().GetComponent<playerHealth>().playerDamaged(damage, "ink");
                weaponRenderer.sprite = ink;
            }
        }
    }
    public override void equip(GameObject parent)//parent is gunHolder
    {
        base.equip(parent);
        //don't cut yourself
        meleeCheck.ignore(parent);
        animDuration = 0;
    }
    public override void flip(bool flip)
    {
        base.flip(flip);
        meleeCheck.flip(flip);
        trail.flip(flip);
    }
    public override void FixedUpdate()
    {
        base.FixedUpdate();
        frame++;
        if (frame > 1000)
        {
            frame = 0;
        }
        swing();
    }
    public override void Awake()
    {
        base.Awake();
        animDuration = 0;
    }
}