using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class meleeTrail : MonoBehaviour
{
    private Vector2 myOffset;
    private TrailRenderer trailRenderer;
    public void flip(bool flip)
    {
        if (flip)
        {
            gameObject.gameObject.transform.localPosition = new Vector2(myOffset.x, myOffset.y);
        }
        else
        {
            gameObject.gameObject.transform.localPosition = new Vector2(myOffset.x, -myOffset.y);
        }
    }
    public void on(bool enabled)
    {
        trailRenderer.enabled = enabled;
    }
    private void Awake()
    {
        trailRenderer = GetComponent<TrailRenderer>();
        myOffset = gameObject.transform.localPosition;
        trailRenderer.enabled = false;
    }
}
