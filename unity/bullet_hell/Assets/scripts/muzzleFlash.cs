using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class muzzleFlash : MonoBehaviour
{
    //instantiated on Fire

    public List<Sprite> muzzleFrames;
    public int animDuration;//muzzleframes length
    private int frame = 0;
    private float divide = 4;//15fps anim, 60fps update
    private int current = 0;
    public SpriteRenderer flashRenderer;

    private void Awake()
    {
        current = 0;
        animDuration = muzzleFrames.Count;
    }
    private void anim()
    {
        if (animDuration > 0 && frame % divide == 0)
        {
            animDuration--;
            flashRenderer.sprite = muzzleFrames[current];
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
