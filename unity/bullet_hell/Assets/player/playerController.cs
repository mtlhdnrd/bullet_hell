using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

public class playerController : MonoBehaviour {
    [Header("Player Component Reference")]
    [SerializeField] Rigidbody2D rb;

    [Header("Player Settings")]
    [SerializeField] float speed;
    [SerializeField] float jumpingPower;
    [SerializeField] float coyote;
    [SerializeField] Transform flip;
    [SerializeField] Transform gunHold;
    [SerializeField] Transform head;
    [SerializeField] Transform body;


    [Header("PlayerLogs")]
    public int jumpLeft;
    public float coyoteCount;
    public float jumpBuffer;
    public float horizontal;
    

    private void FixedUpdate() {
        //!----------MOVEMENT----------!
        //moves get executed per physics update
        rb.velocity = new Vector2(horizontal * speed, rb.velocity.y);     
        //coyote decreases mid-air
        if(coyoteCount > 0 && !groundCheckP1.grounded) { coyoteCount -= 0.2f; }
        //buffer decreases mid-air
        if(jumpBuffer > 0) { jumpBuffer -= 0.50f; }

        //buffered jump on landing
        if (groundCheckP1.grounded && jumpBuffer >0)
        {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
        }
        
    }

    private void Awake()
    {

    }

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        Flip();
    }

    public void Move(InputAction.CallbackContext context) {
        horizontal = context.ReadValue<Vector2>().x;
    }

    public void Jump(InputAction.CallbackContext context) {
        if(context.performed && groundCheckP1.grounded) {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
        } 
        else jumpBuffer = 1f;
    }
    public void Fire(InputAction.CallbackContext context)
    {
        
    }

    public void Flip()
    {
        Vector3 mouseScreenPos = Input.mousePosition;
        Vector3 mouseWorldPos=Camera.main.ScreenToWorldPoint(mouseScreenPos);

        if (mouseWorldPos.x>transform.position.x)
        {
            body.rotation = Quaternion.Euler(0,180,0);
            head.eulerAngles = new Vector3(180f, head.eulerAngles.y, head.eulerAngles.z);
        }
        if (mouseWorldPos.x < transform.position.x)
        {
            body.rotation = Quaternion.Euler(0, 0, 0);
            head.eulerAngles = new Vector3(0f, head.eulerAngles.y, head.eulerAngles.z);

        }

       
    }
}
