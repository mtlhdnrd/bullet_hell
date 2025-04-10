using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Experimental.Rendering;

public class animatedBg : MonoBehaviour
{
    public List<Sprite> sprites;
    private int frame;
    private int current;
    [SerializeField] SpriteRenderer backgroundRenderer;

    private void Awake()
    {
        current = 0;
    }

    private void playAnim()
    {
        backgroundRenderer.sprite = sprites[current];

        if (frame % 4 == 0 && current < sprites.Count-1)
        {
            current++;
        }
        else if (frame % 4 == 0)
        {
            current = 0;
        }
    }

    void FixedUpdate()
    {
        playAnim();
        if (frame > sprites.Count*600) { frame = 0; }//there are 12 frames so this will be close i hope
        else { frame++; }
    }
}
