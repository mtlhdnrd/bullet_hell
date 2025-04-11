using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class weapon : MonoBehaviour
{
    [Header("refs and logs")]
    public Rigidbody2D rb;
    public BoxCollider2D coll;
    public int frame;
    public float currentRecoil;
    public float cooldown;//1 = 1 frame
    public Vector2 collOffset;
    public List<Vector3> weaponAnim;//x, y, rotation
    public Vector3 weaponAnimCurrent;
    public GameObject shootingPointObj;
    public Vector2 spOffset;
    public bool flipped;
    public bool shooting;
    public bool altShooting;

    [Header("WEAPON SETTINGS")]
    public float[] handCloseOffset = new float[3];
    public float[] handFarOffset = new float[3];
    public float[] weaponOffset = new float[3];
    public string weaponName;
    public char[] weaponHands;
    public int farLayer;
    public int magazine;//single magazine cap
    public int rarity;//unique, rare, common
    public bool ranged;//ranged or melee
    public bool showMag;
    public int damage;//per projectile
    public bool auto;//semi or automatic
    public float recoil;
    public float recoilSpeed;
    public float projSpeed;
    public float firerate;//shots per second

    //FLIP SHOOTING POINT TOO
    public virtual void Fire()
    {
        //use firing function of a weapon
    }
    public virtual void recoilAnim(float speed)
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
    public virtual void flip(bool right)
    {
        flipped = right;//used by "swing"
        if (right)
        {
            GetComponent<SpriteRenderer>().flipY = false;
            coll.offset = new Vector2(coll.offset.x, collOffset.y);
            if (shootingPointObj != null)
            {
                shootingPointObj.transform.localPosition = new Vector2(spOffset.x, spOffset.y);
            }
        }
        else
        {
            GetComponent<SpriteRenderer>().flipY = true;
            coll.offset = new Vector2(coll.offset.x, -collOffset.y);
            if (shootingPointObj != null)
            {
                shootingPointObj.transform.localPosition = new Vector2(spOffset.x, -spOffset.y);
            }
        }
    }
    public virtual void AltFire()
    {
        //use alt firing function of a weapon
    }
    public virtual void equip(GameObject parent)
    {
        if (parent != null)
        {
            transform.SetParent(parent.transform);
            rb.mass = 0;
            rb.simulated = false;
        }
        else
        {
            transform.SetParent(null);
            rb.simulated = true;
            rb.mass = 1;
            rb.velocity = Vector3.zero;
            rb.angularVelocity = 0;
        }
    }
    public virtual void FixedUpdate()
    {
        if (cooldown > 0) { cooldown -= 1f; }
    }
    public virtual void Awake()
    {
        collOffset = coll.offset;
        spOffset = shootingPointObj.transform.localPosition;
    }
}