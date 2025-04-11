using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class groundCheck : MonoBehaviour {

    public bool grounded;
    public bool getGrounded()
    {
        if (grounded) { return true; }
        else return false;
    }
    private void OnCollisionEnter2D(Collision2D other) {
        if(other.gameObject.CompareTag("ground")) { grounded = true; }
    }
    private void OnCollisionExit2D(Collision2D other) {
        if(other.gameObject.CompareTag("ground")) { grounded = false; }
    }
}
