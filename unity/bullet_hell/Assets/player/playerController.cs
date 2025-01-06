using System.Collections;
using System.Collections.Generic;
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

    [Header("Grounding")]
    [SerializeField] LayerMask groundLayer;
    [SerializeField] Transform groundCheck;

    private float horizontal;

    private void FixedUpdate() {
        rb.velocity = new Vector2(horizontal * speed, rb.velocity.y);
    }

    public void Move(InputAction.CallbackContext context) {
        horizontal = context.ReadValue<Vector2>().x;
    }

    public void Jump(InputAction.CallbackContext context) {
        if(context.performed && IsGrounded()) {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
        }
    }

    private bool IsGrounded() {
        return Physics2D.OverlapCapsule(groundCheck.position, new Vector2(.45f, 0.1f), CapsuleDirection2D.Horizontal, 0, groundLayer);
    }

    // Start is called before the first frame update
    void Start() {

    }

    // Update is called once per frame
    void Update() {

    }
}
