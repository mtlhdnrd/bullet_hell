using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;

public class chainsaw : weapon
{
    [Header("dependencies")]
    public meleeCheck meleeCheck;
    public List<GameObject> collisionWith;
    public meleeTrail trail;
    public Sprite clean;
    public Sprite ink;
    public SpriteRenderer weaponRenderer;
    public bool equipped;
    public bool inked;
    [SerializeField] List<Sprite> chainsClean;
    [SerializeField] List<Sprite> chainsInk;

    [Header("logs n settings")]
    public int chainsCurrent;
    public int offsetCurrent;

    private void offsetAnim()
    {
        if (frame % 4 == 0 && magazine > 0)//15fps
        {
            offsetCurrent++;
            if (offsetCurrent == weaponAnim.Count) offsetCurrent = 0;//cycle
            if (flipped)
            {
                weaponAnimCurrent = weaponAnim[offsetCurrent];
            }
            else
            {
                weaponAnimCurrent = new Vector3(weaponAnim[offsetCurrent].x, -weaponAnim[offsetCurrent].y, -weaponAnim[offsetCurrent].z);
            }
        }
    }
    private void chainAnim()
    {
        if (frame % 4 == 0 && magazine > 0)//15fps
        {
            chainsCurrent++;
            if (chainsCurrent == chainsClean.Count) chainsCurrent = 0;//cycle
            if (inked) { weaponRenderer.sprite = chainsInk[chainsCurrent]; }
            else { weaponRenderer.sprite = chainsClean[chainsCurrent]; }
        }
    }
    private void check()
    {
        if (meleeCheck.getColl() != null)
        {
            meleeCheck.getColl().GetComponent<playerHealth>().playerDamaged(damage, "ink");
            weaponRenderer.sprite = ink;
        }
    }
    public override void Fire()
    {
        //firing happens
        if (cooldown <= 0 && magazine > 0)
        {
            cooldown = 60 / firerate;
            magazine--;
            check();
        }
    }
    public override void AltFire()
    {
        base.AltFire();
    }
    public override void equip(GameObject parent)//meleeAnim or null (called by gunHolder)
    {
        base.equip(parent);
        equipped = parent != null;
        meleeCheck.ignore(parent);
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
        if (shooting)
        {
            trail.on(true);
            chainAnim();
            offsetAnim();
        }
        else { trail.on(false); chainsCurrent = 0; offsetCurrent = 0; }
    }
    public override void Awake()
    {
        base.Awake();
    }
}