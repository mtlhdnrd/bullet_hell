using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Rendering.Universal;
using UnityEngine.UIElements;
using static TMPro.SpriteAssetUtilities.TexturePacker_JsonArray;

public class cyclops : weapon
{
    [SerializeField] SpriteRenderer weaponRenderer;

    [Header("bullet refs")]
    public GameObject muzzleFlash;
    public GameObject bullet;
    [SerializeField] GameObject laser;
    private int animDuration;
    [SerializeField] List<Sprite> fireAnim;
    [SerializeField] List<Sprite> laserAnim;
    private bool owned;
    public float currentAim;
    public float dispersion;
    private float currentDisp;
    private int laserCurrent;
    private int fireCurrent;
    private float baseSpeed;

    public override void Fire()
    {
        //firing happens
        if (cooldown <= 0 && magazine > 0)
        {
            //---BULLET ATTRIBUTES---
            GameObject tempBullet = bullet;
            tempBullet.GetComponent<bullet>().ignored = GetComponentInParent<playerController>().name;
            tempBullet.GetComponent<bullet>().damage = damage;
            tempBullet.GetComponent<bullet>().speed = projSpeed;

            cooldown = 60 / firerate;//60=1s
            magazine--;
            //GetComponent<AudioSource>().Play();

            //---BULLET---
            Instantiate(tempBullet, shootingPointObj.transform.position, Quaternion.Euler(0, 0, transform.eulerAngles.z + UnityEngine.Random.Range(-currentDisp, currentDisp)));
            Debug.Log(currentDisp);

            //---MUZZLE FLASH---
            Instantiate(muzzleFlash, shootingPointObj.transform.position, transform.rotation);

            //---RECOIL---
            currentRecoil = recoil;

            //---WEAPON ANIM---
            fireCurrent = 0;
            resetAim();
            altShooting = false;
            animDuration = fireAnim.Count;
        }
    }
    private void checkAim()
    {
        if (altShooting)
        {
            GetComponentInParent<playerController>().speed = baseSpeed / 2;
            Debug.Log(currentAim);

            //aim anim
            if (laserCurrent < laserAnim.Count && frame % 4 == 0)//15fps
            {
                laser.GetComponent<Light2D>().lightCookieSprite = laserAnim[laserCurrent];
                Debug.Log("altFiring");
                laserCurrent++;
            }
            //aim
            if (currentAim < 1)
            {
                currentAim += .06f;
                currentDisp = dispersion - dispersion * currentAim;
            }
            //clamp aim
            else if (currentAim > 1)
            {
                currentAim = 1;
            }
        }
        else
        {
            resetAim();
            if (owned)
            {
                GetComponentInParent<playerController>().speed = baseSpeed;
            }
        }
    }
    private void resetAim()
    {
        currentAim = 0;
        laserCurrent = 0;
        currentDisp = dispersion;
        laser.GetComponent<Light2D>().lightCookieSprite = null;
    }
    private void playAnim(List<Sprite> anim)
    {
        if (animDuration > 0 && frame % 4 == 0)//15fps
        {
            animDuration--;
            weaponRenderer.sprite = anim[fireCurrent];
            fireCurrent++;
        }
    }
    public override void flip(bool right)
    {
        base.flip(right);
        if (right)
        {
            laser.transform.localPosition = new Vector2(laser.transform.localPosition.x, -0.115f);
        }
        else
        {
            laser.transform.localPosition = new Vector2(laser.transform.localPosition.x, 0.115f);
        }

    }
    public override void recoilAnim(float speed)
    {
        if (currentRecoil > 0)
        {
            currentRecoil -= speed;
        }
        else
        {
            currentRecoil = 0;
        }
    }
    public override void equip(GameObject parent)
    {
        base.equip(parent);

        if (parent != null)
        {
            owned = true;
            baseSpeed = GetComponentInParent<playerController>().speed;
        }
        else
        {
            owned = false;
        }
    }
    public override void FixedUpdate()
    {
        base.FixedUpdate();
        frame++;
        if (frame > 1000)
        {
            frame = 0;
        }
        recoilAnim(recoilSpeed);
        playAnim(fireAnim);
        checkAim();
    }
    public override void Awake()
    {
        base.Awake();
    }
}
