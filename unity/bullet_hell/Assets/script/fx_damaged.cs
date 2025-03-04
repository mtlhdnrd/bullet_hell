using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class fx_damaged : MonoBehaviour
{
    //instantiated on Fire

    public List<Sprite> damageFrames;
    public int animDuration;//muzzleframes length
    private int frame = 0;
    private float divide = 4;//15fps anim, 60fps update
    private int current = 0;
    public SpriteRenderer flashRenderer;

    private void Awake()
    {
        flashRenderer = GetComponent<SpriteRenderer>();
        current = 0;
        animDuration = damageFrames.Count;
    }


    private void anim()
    {
        if (animDuration > 0 && frame % divide == 0)
        {
            animDuration--;
            flashRenderer.sprite = damageFrames[current];
            current++;
        }
        else if (animDuration == 0 && current != 0)
        {
            Destroy(gameObject);
        }
    }

    private void FixedUpdate()
    {
        frame++;
        anim();
    }
}
