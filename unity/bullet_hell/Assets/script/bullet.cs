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

    // Start is called before the first frame update
    void Awake()
    {
        go();
    }

    private void go()//fly
    {
        rb.velocity = transform.right * -speed;
    }

    private void check()//player collision check
    {

    }


    private void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            other.gameObject.GetComponent<playerHealth>().playerDamaged(damage, "ink");
        }
        Destroy(gameObject);
    }

    // Update is called once per frame
    void Update()
    {
        check();
    }
}
