using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class shotgun : weapon
{
    [Header("bullet refs")]
    public GameObject muzzleFlash;
    public GameObject bullet;
    [SerializeField] int pelletCount;
    float aimDir;
    public override void Fire()
    {
        //firing happens
        if (cooldown <= 0 && magazine > 0)
        {
            cooldown = 60 / firerate;//60=1s
            magazine--;
            //GetComponent<AudioSource>().Play();

            //---BULLET ATTRIBUTES---
            GameObject tempBullet = bullet;
            tempBullet.GetComponent<bullet>().ignored = GetComponentInParent<playerController>().name;
            tempBullet.GetComponent<bullet>().damage = damage;
            tempBullet.GetComponent<bullet>().speed = projSpeed;

            //---BULLET---
            for (int i = 0; i < 7; i++)
            {
                Instantiate(tempBullet, shootingPointObj.transform.position, Quaternion.Euler(0, 0, transform.eulerAngles.z + UnityEngine.Random.Range(-15f, 15f)));
            }

            //---MUZZLE FLASH---
            Instantiate(muzzleFlash, shootingPointObj.transform.position, shootingPointObj.transform.rotation);

            //---RECOIL---
            currentRecoil = recoil;
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

    public override void flip(bool right)
    {
        base.flip(right);

    }

    private void Update()
    {
        aimDir = transform.rotation.z;
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
    }
}