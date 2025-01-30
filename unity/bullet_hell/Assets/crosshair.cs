using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class crosshair : MonoBehaviour
{

    private void Awake()
    {
        
    }
    // Start is called before the first frame update
    void Start()
    {
        Cursor.visible = false;
    }

    // Update is called once per frame
    void Update()
    {
        Vector2 mousepos= Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position=mousepos;
    }
}
