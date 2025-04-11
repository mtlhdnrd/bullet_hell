using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class musicShowFight : MonoBehaviour
{
    [SerializeField] SpriteRenderer cover;
    [SerializeField] GameObject title;
    [SerializeField] GameObject artist;
    [SerializeField] GameObject parent;
    public int frame;
    public int current;
    public List<Vector2> posAnim;//x is y, y is opacity
    public int fadeInDuration, fadeOutDuration, waitDuration;
    public void updateShow(Sprite coverart, string titleRef, string artistRef)
    {
        show(false);
        cover.sprite = coverart;
        title.GetComponent<TextMeshProUGUI>().text = titleRef;
        artist.GetComponent<TextMeshProUGUI>().text = artistRef;
        show(true);
        fadeIn();
    }
    public void fadeIn()
    {
        if (fadeInDuration > 0 && frame % 4 == 0)
        {
            parent.transform.localPosition = new Vector2(0, posAnim[current].x-5);
            cover.color = new Color(255, 255, 255, posAnim[current].y);
            title.GetComponent<TextMeshProUGUI>().color = new Color(255, 255, 255, posAnim[current].y);
            artist.GetComponent<TextMeshProUGUI>().color = new Color(255, 255, 255, posAnim[current].y);
            fadeInDuration--;
            current++;
        }
        if (fadeInDuration == 1)
        {
            waitDuration = 50;
        }
    }
    public void wait()
    {
        if (waitDuration > 0 && frame % 4 == 0)
        {
            waitDuration--;
        }
        if (waitDuration == 1)
        {
            fadeOutDuration = posAnim.Count;
            current = posAnim.Count - 1;
        }
    }
    public void fadeOut()
    {
        if (fadeOutDuration > 0 && frame % 4 == 0)
        {
            parent.transform.localPosition = new Vector2(0, posAnim[current].x-5);
            cover.color = new Color(255, 255, 255, posAnim[current].y);
            title.GetComponent<TextMeshProUGUI>().color = new Color(255, 255, 255, posAnim[current].y);
            artist.GetComponent<TextMeshProUGUI>().color = new Color(255, 255, 255, posAnim[current].y);
            fadeOutDuration--;
            current--;
        }
        if (fadeOutDuration == 1)
        {
            show(false);
        }
    }
    private void anim()
    {
        fadeIn();
        fadeOut();
        wait();
    }
    public void show(bool show)
    {
        if (show)
        {
            fadeInDuration = posAnim.Count;
            current = 0;
        }
        else
        {
            cover.sprite = null;
            title.GetComponent<TextMeshProUGUI>().text = "";
            artist.GetComponent<TextMeshProUGUI>().text = "";
        }
    }
    private void FixedUpdate()
    {
        frame++;
        if (frame > 600)
        {
            frame = 0;
        }
        anim();
    }
}
