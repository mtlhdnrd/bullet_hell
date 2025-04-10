using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;

public class death : weapon
{
    [Header("dependencies")]
    public meleeCheck meleeCheck;
    public meleeTrail trail1;
    public meleeTrail trail2;
    public meleeTrail trail3;
    public Sprite clean;
    public Sprite ink;
    public SpriteRenderer weaponRenderer;

    [Header("logs n settings")]
    public bool check;
    private int current;//current frame
    private int animDuration;

    public override void Fire()
    {
        damage = 100;
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
            trail1.on(false);
            trail2.on(false);
            trail3.on(false);
            weaponAnimCurrent = Vector3.zero;
        }
        if (animDuration == 3 && check)
        {
            trail1.on(true);
            trail2.on(true);
            trail3.on(true);
            if (meleeCheck.getColl() != null)
            {
                onHit();
            }
        }
    }
    private void onHit()
    {
        check = false;
        meleeCheck.getColl().GetComponent<playerHealth>().playerDamaged(100, "ink");
        meleeCheck.getColl().GetComponentInChildren<gunHolder>().Drop();
        weaponRenderer.sprite = ink;
        damage = 0;
    }
    public override void equip(GameObject parent)//parent is gunHolder
    {
        base.equip(parent);
        meleeCheck.ignore(parent);
        animDuration = 0;
    }
    public override void flip(bool flip)
    {
        base.flip(flip);
        meleeCheck.flip(flip);
        trail1.flip(flip);
        trail2.flip(flip);
        trail3.flip(flip);
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