using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bullet : MonoBehaviour
{
    public Rigidbody2D rb;
    public BoxCollider2D col;
    public float speed;
    public int damage;
    public string ignored;

    // Start is called before the first frame update
    void Awake()
    {
        go();
    }
    private void go()//fly
    {
        rb.velocity = transform.right * -speed;
    }
    private void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.name != ignored)
        {
            if (other.gameObject.name == "Player1" || other.gameObject.name == "Player2")
            {
                other.gameObject.GetComponent<playerHealth>().playerDamaged(damage, "ink");
                damage = 0;
                Destroy(this);
            }
            if (!other.gameObject.CompareTag("projectile") && !other.gameObject.CompareTag("weapon"))
            {
                Destroy(gameObject);
            }
        }
    }
}