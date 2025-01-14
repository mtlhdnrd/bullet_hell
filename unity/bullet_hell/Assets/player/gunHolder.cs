using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class gunHolder : MonoBehaviour
{
    //variables
    private Transform gunTransform;



    //functions
    private void lookAtMouse()
    {
        Vector2 direction = Camera.main.ScreenToWorldPoint(Input.mousePosition)-gunTransform.position;
        float angle = Mathf.Atan2(direction.y,direction.x)*Mathf.Rad2Deg;
        Quaternion rotation = Quaternion.Euler(transform.rotation.eulerAngles.x,transform.rotation.eulerAngles.y, angle-180);
        gunTransform.rotation = rotation;
    }


    //defaults
    private void FixedUpdate()
    {

        lookAtMouse();
    }
    void Start()
    {
        gunTransform=transform;
    }
}
