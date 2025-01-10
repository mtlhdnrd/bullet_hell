using System.Collections;
using System.Collections.Generic;
using UnityEditor.Tilemaps;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.Windows;

public class playerController : MonoBehaviour {
    [Header("Player Component Reference")]
    [SerializeField] Rigidbody2D rb;

    [Header("Player Settings")]
    [SerializeField] float speed;
    [SerializeField] float jumpingPower;
    [SerializeField] float coyote;

    private float horizontal;
    private bool grounded;
    public int jumps, jumpLeft;
    public float coyoteCount;
    public float jumpBuffer;

    private void FixedUpdate() {
        rb.velocity = new Vector2(horizontal * speed, rb.velocity.y);
        if(coyoteCount > 0 && !grounded) { coyoteCount -= 0.1f; }
        if(jumpBuffer > 0) { jumpBuffer -= 0.1f; }

    }

    public void Move(InputAction.CallbackContext context) {
        horizontal = context.ReadValue<Vector2>().x;
    }

    public void Jump(InputAction.CallbackContext context) {
        if(context.performed && coyoteCount > 0 && jumpLeft > 0) {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
            jumpLeft--;
        } else jumpBuffer = 1;
    }
    public void Fire(InputAction.CallbackContext context)
    {

    }

    private void OnCollisionEnter2D(Collision2D other) {
        if(other.gameObject.CompareTag("ground")) {
            grounded = true;
            jumpLeft = jumps;
            coyoteCount = coyote;

        }
        if(jumpBuffer>0) {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
            jumpLeft--;
            jumpBuffer = 0;
        }


    }
    private void OnCollisionExit2D(Collision2D other) {
        if(other.gameObject.CompareTag("ground")) { grounded = false;}
    }


    // Start is called before the first frame update
    void Start() {

    }

    // Update is called once per frame
    void Update() {

    }
}
