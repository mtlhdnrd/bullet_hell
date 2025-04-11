using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;
using static TMPro.SpriteAssetUtilities.TexturePacker_JsonArray;

public class nobunaga : weapon
{
    [SerializeField] SpriteRenderer weaponRenderer;

    [Header("bullet refs")]
    public GameObject muzzleFlash;
    public GameObject bullet;
    private int animDuration;
    [SerializeField] List<Sprite> fireAnim;

    private int current;
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
            Instantiate(tempBullet, shootingPointObj.transform.position, transform.rotation);

            //---MUZZLE FLASH---
            Instantiate(muzzleFlash, shootingPointObj.transform.position, transform.rotation);

            //---RECOIL---
            currentRecoil = recoil;

            //---WEAPON ANIM---
            current = 0;
            animDuration = fireAnim.Count;
        }
    }
    private void playAnim(List<Sprite> anim)
    {
        if (animDuration > 0 && frame % 4 == 0)//15fps
        {
            animDuration--;
            weaponRenderer.sprite = anim[current];
            current++;
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
    }
}
