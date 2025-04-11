using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using UnityEngine.UIElements;

public class playerController : MonoBehaviour
{
    [Header("Player Component Reference")]
    [SerializeField] Rigidbody2D rb;
    public Collider2D coll;//prevent self-damage

    [Header("Player Settings")]
    public float speed;//affected by taser
    public float jumpingPower;//affected by taser
    [SerializeField] float coyote;
    public int fps;
    [SerializeField] Transform flip;
    [SerializeField] Transform head;
    [SerializeField] Transform body;
    public groundCheck groundCheck;

    [Header("script refs")]
    public gunHolder gunHolder;
    public playerAssets playerAssets;
    public float deadzone;
    public Vector2 aimDirection;
    public bool gamepad;

    [Header("PlayerLogs")]
    public int jumpLeft;
    public float coyoteCount;
    public float jumpBuffer;
    public float horizontal;
    public float vertical;
    public bool moving;
    public int maxHealth;
    public int currentHealth;
    public bool forwardMotion;
    public bool grounded;//if on ground
    public bool laddered;//if touching ladder
    public bool facingRight;
    public bool shooting;
    public bool altShooting;
    private void FixedUpdate()
    {
        //!----------MOVEMENT----------!
        //moves get executed per physics update
        rb.velocity = new Vector2(horizontal * speed, rb.velocity.y);
        //coyote decreases mid-air
        if (coyoteCount > 0 && !grounded) { coyoteCount -= 0.2f; }
        //buffer decreases mid-air
        grounded = groundCheck.getGrounded();
        //shooting
        if (shooting)
        {
            gunHolder.Fire();
        }
        if (altShooting)
        {
            gunHolder.AltFire();
        }
    }
    // Update is called once per frame
    void Update()
    {
        if (!gamepad)//m+k only
        {
            aimDirection = Input.mousePosition - Camera.main.WorldToScreenPoint(transform.position);
        }
        Climb();
        gunHolder.lookAt(aimDirection);
        flipSprite(aimDirection.x > 0);//if need flip
        currentHealth = GetComponent<playerHealth>().currentHealth;
    }
    public void init(string skin, Vector3 pos, int health, playerAssets assetsRef, Vector2 initialDirection)
    {
        shooting = false;
        altShooting = false;
        aimDirection = initialDirection;
        //set scheme
        if (GetComponent<PlayerInput>().currentControlScheme.Contains("pad"))
        {
            gamepad = true;
        }
        else
        {
            gamepad = false;
        }

        playerAssets = assetsRef;
        deadzone = .25f;//gamepad deadzone
        gameObject.GetComponentInChildren<bodyAnim>().init(skin, assetsRef);//skin
        gameObject.transform.position = pos;//spawn position
        gameObject.GetComponentInChildren<playerHealth>().init(200, assetsRef);//set health
        gunHolder = GetComponentInChildren<gunHolder>();
        gunHolder.set();
    }
    public void flipSprite(bool right)//look left/right
    {
        //facing right
        if (right)
        {
            body.GetComponentInChildren<SpriteRenderer>().flipX = true;
            moveDirection(true);
        }
        //facing left
        else
        {
            body.GetComponentInChildren<SpriteRenderer>().flipX = false;
            moveDirection(false);
        }



    }
    private void moveDirection(bool lookingRight)
    {
        //if looks right and goes right -> forward motion
        if (lookingRight && horizontal > 0) { forwardMotion = true; }
        //if looks left and goes right -> backwards motion
        else if (!lookingRight && horizontal > 0) { forwardMotion = false; }
        //if looks left and goes left -> forward motion
        else if (!lookingRight && horizontal < 0) { forwardMotion = true; }
        //if looks right and goes left -> backwards motion
        else if (lookingRight && horizontal < 0) { forwardMotion = false; }
    }
    public void Look(InputAction.CallbackContext context)//GAMEPAD ONLY
    {
        if (gamepad && deadzoneCheck(context.ReadValue<Vector2>()[0], context.ReadValue<Vector2>()[1]))
        {
            aimDirection = context.ReadValue<Vector2>();
        }
    }
    private bool deadzoneCheck(float xInput, float yInput)//called by look
    {
        if (Mathf.Abs(xInput) > deadzone || Mathf.Abs(yInput) > deadzone)
        {
            return true;//out of deadzone
        }
        return false;//still in deadzone
    }
    //controls
    public void Move(InputAction.CallbackContext context)
    {
        //VALUES
        horizontal = context.ReadValue<Vector2>().x;
        vertical = context.ReadValue<Vector2>().y;
        //WALK
        rb.velocity = new Vector2(horizontal * speed, rb.velocity.y);

        //ANIM
        if (context.performed && (horizontal != 0 || vertical != 0))
        {
            moving = true;
        }
        else
        {
            moving = false;
        }
    }
    private void Climb()
    {
        if (vertical > 0 && laddered)
        {
            rb.velocity = new Vector2(rb.velocity.x, vertical * speed);
        }
    }
    public void Jump(InputAction.CallbackContext context)
    {
        if (context.performed && groundCheck.getGrounded())
        {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
        }
        else jumpBuffer = 1f;
    }
    public void Fire(InputAction.CallbackContext context)
    {
        if (context.started)
        {
            shooting = true;
        }
        if (context.canceled)
        {
            shooting = false;
        }
        if (context.performed)
        {
            gunHolder.Fire();
        }
        if (gunHolder.weaponScript != null)
        {
            gunHolder.weaponScript.shooting = shooting;
        }
    }
    public void AltFire(InputAction.CallbackContext context)
    {
        if (context.started)
        {
            altShooting = true;
        }
        if (context.canceled)
        {
            altShooting = false;
        }
        if (context.performed)
        {
            gunHolder.AltFire();
        }
        if (gunHolder.weaponScript != null)
        {
            gunHolder.weaponScript.altShooting = altShooting;
        }
    }
    public void Equip(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            shooting = false;
            altShooting = false;
            gunHolder.Equip();
        }
    }
    public void Drop(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            shooting = false;
            altShooting = false;
            gameObject.GetComponentInChildren<gunHolder>().Drop();
        }
    }
    //ladders and deaths
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.CompareTag("death"))
        {
            GetComponent<playerHealth>().death();
        }
        else if (collision.CompareTag("ladder"))
        {
            laddered = true;
        }
    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.CompareTag("ladder"))
        {
            laddered = false;
        }
    }
    private void Awake()
    {
        shooting = false;
    }
}