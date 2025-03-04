using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class groundCheckP1 : MonoBehaviour {

    //public static for outside accessibility
    public static bool grounded;

    // Start is called before the first frame update
    void Start() {

    }

    // Update is called once per frame
    void Update() {
    }

    private void OnCollisionStay2D(Collision2D other) {
        if(other.gameObject.CompareTag("ground")) { grounded = true; }
    }
    private void OnCollisionExit2D(Collision2D other) {
        if(other.gameObject.CompareTag("ground")) { grounded = false; }
    }

}
