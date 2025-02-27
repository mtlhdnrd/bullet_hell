using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Experimental.Rendering;

public class mainMenuBg : MonoBehaviour {
    public Sprite[] frames;
    private int i, divide, current;

    private void Awake() {
        current = 0;
        divide = 4; //gives 15fps because fixedUpdate goes 60 base
    }

    private void bgLoop() {
        gameObject.GetComponent<SpriteRenderer>().sprite = frames[current];

        if(i % divide == 0 && current < frames.Length - 1) {
            current++;
        } else if(i % divide == 0) {
            current = 0;
        }
    }

    void FixedUpdate() {
        bgLoop();
        if(i > 1200) { i = 0; }//there are 12 frames so this will be close i hope
        else { i++; }
    }
}
