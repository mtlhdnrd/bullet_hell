using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UIElements;

public class healthbar : MonoBehaviour
{
    [Header("sprite refs")]
    public Sprite frontL;
    public Sprite hamHealthL;
    public Sprite hamHealthR;
    public Sprite pracHealthL;
    public Sprite pracHealthR;
    public Sprite japHealthL;
    public Sprite japHealthR;
    public Sprite backL;

    [Header("obj refs")]
    public GameObject frontObj;
    public GameObject healthObj;
    public GameObject backObj;

    [Header("healthbar position")]
    public Vector2 position;

    public void init(string player, string mapName)//called by gameManager together with mapload and the rest
    {
        if (player == "p1" && mapName == "ham")
        {
            initShort(backL, frontL, hamHealthL, position);
        }
        else if (player == "p1" && mapName == "prac")
        {
            initShort(backL, frontL, pracHealthL, position);
        }
        else if (player == "p1" && mapName == "jap")
        {
            initShort(backL, frontL, japHealthL, position);
        }
    }

    
    private void initShort(Sprite back, Sprite front, Sprite health, Vector2 position)
    {
        backObj.GetComponent<SpriteRenderer>().sprite = back;//back plate sprite
        frontObj.GetComponent<SpriteRenderer>().sprite = front;//front plate sprite
        healthObj.GetComponent<SpriteRenderer>().sprite = health;//health sprite
        healthObj.transform.localScale = new Vector2(.86f, 1);//.86 compensation
        transform.localPosition = position;//this can be mirrored
    }

    public void healthUpdate(string player, int health)
    {
        float scale = health / 200f;//this gives us the health we can use for scale
        healthObj.transform.localScale = new Vector2(scale * .86f, 1);
        transform.localPosition = position;
    }

}
