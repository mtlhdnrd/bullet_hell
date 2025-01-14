using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Unity.PlasticSCM.Editor.WebApi;
using UnityEngine;

public class bodyAnim : MonoBehaviour
{

    [Header("Script refs")]
    [SerializeField] playerController script;

    [Header("Walkcycle refs")]
    [SerializeField] Sprite walk1;
    [SerializeField] Sprite walk2;
    [SerializeField] Sprite walk3;
    [SerializeField] Sprite walk4;
    [SerializeField] Sprite walk5;
    [SerializeField] Sprite walk6;

    public List<Sprite> walk;
    public int current=0;
    public int i;
    //asszem 10fps vagy valami
    public int divide;
    private void Awake()
    {
        
        i = 0;
        walk= new List<Sprite> { walk1, walk2, walk3, walk4, walk5, walk6 };
    }


    // Start is called before the first frame update
    void Start()
    {
        
    }
    //bc fixed fps there
    private void FixedUpdate()
    {
        
        
    }

    // Update is called once per frame
    void Update()
    {
        i++;


        if (script.forward && i % divide == 0) { if (current < 5) { current++; } else { current = 0; } }
        gameObject.GetComponent<SpriteRenderer>().sprite = walk[current];
    }
}
