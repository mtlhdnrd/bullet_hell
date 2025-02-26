using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class weapon : MonoBehaviour
{
    public Rigidbody2D rb;
    public BoxCollider2D coll;
    public float[] handCloseOffset = new float[3];
    public float[] handFarOffset = new float[3];
    public float[] weaponOffset = new float[3];
    public string weaponName;
    public char[] weaponHands;
    public int magazine;
    public int rarity;
    public bool ranged;
    public int damage;
    public float projSpeed;
    public float firerate, cooldown;
    //cooldown = 1/firerate
    //firerate = [weapon specific]
    //cooldown is always 1 second.


    public virtual void Fire()
    {
        //use firing function of a weapon
    }

    public virtual void AltFire()
    {
        //use alt firing function of a weapon
    }

    public virtual void Throw()
    {
    }

    public virtual void SetValues()
    {
    }

    public virtual void equip(GameObject parent)
    {
        transform.SetParent(parent.transform);
        SetValues();
    }

    public virtual void FixedUpdate()
    {
        if (cooldown > 0) { cooldown -= .016f; }
    }
}
