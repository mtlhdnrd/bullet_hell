using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class meleeCheck : MonoBehaviour
{
    Collider2D check;
    private Vector2 checkOffset;
    public List<GameObject> collisionWith = new List<GameObject>();

    public string ignorePlayer;
    public void ignore(GameObject playerRef)//by gunHolder
    {
        collisionWith.Clear();
        if (playerRef != null && playerRef.GetComponentInParent<playerController>()!=null)
        {
            ignorePlayer = playerRef.GetComponentInParent<playerController>().gameObject.name;
        }
    }
    public GameObject getColl()
    {
        foreach (GameObject item in collisionWith)
        {
            if (item.GetComponent<playerHealth>() != null)
            {
                return item;
            }
        }
        return null;
    }
    public void flip(bool flip)
    {
        if (flip)
        {
            check.offset = new Vector2(checkOffset.x, checkOffset.y);
        }
        else
        {
            check.offset = new Vector2(checkOffset.x, -checkOffset.y);
        }
    }
    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.name == "Player1" || other.name == "Player2")
        {
            if (!collisionWith.Contains(other.gameObject) && other.name != ignorePlayer)
            {
                collisionWith.Add(other.gameObject);//enemy only
            }
        }
    }
    private void OnTriggerExit2D(Collider2D other)
    {
        collisionWith.Remove(other.gameObject);
    }
    private void Awake()
    {
        check = GetComponent<Collider2D>();
        checkOffset = check.offset;
    }
}
