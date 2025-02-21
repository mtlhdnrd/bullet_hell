using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class healthbar : MonoBehaviour
{
    [Header("sprite refs")]
    public Sprite front;
    public Sprite health;
    public Sprite back;
    public GameObject frontObj;
    public GameObject healthObj;
    public GameObject backObj;

    [Header("healthbar position")]
    public Vector2 position;

    [Header("script refs")]
    public playerHealth healthScript;

    public void init(string player)//called by gameManager together with mapload and the rest
    {
        if (player == "p1")
        {
            backObj.GetComponent<SpriteRenderer>().sprite = back;
            frontObj.GetComponent<SpriteRenderer>().sprite = front;
            healthObj.GetComponent<SpriteRenderer>().sprite = health;
            transform.localPosition = position; 
        }
    }

    private void healthUpdate(string player)
    {
        float scale = healthScript.currentHealth / 200;//this gives us the health we can use for scale
        healthObj.transform.localScale = new Vector2(scale*.85f, 1);
        transform.localPosition = position;
    }

    public void FixedUpdate()
    {
        healthUpdate("p1");
    }
}
