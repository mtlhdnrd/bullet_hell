using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine;

public class scanner : MonoBehaviour
{
    [SerializeField] List<GameObject> collisionWith = null;
    public GameObject getEquippable()
    {
        GameObject toEquip = null;
        if (collisionWith.Count > 0)
        {
            toEquip = collisionWith[0];
            collisionWith.RemoveAt(0);
            return toEquip.gameObject;
        }
        return null;
    }
    private void OnTriggerStay2D(Collider2D collision)
    {
        if (collision.CompareTag("weapon") && !collisionWith.Contains(collision.gameObject))
        {
            collisionWith.Add(collision.gameObject);
        }
    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.CompareTag("weapon"))
        {
            collisionWith.Remove(collision.gameObject);
        }
    }
}
